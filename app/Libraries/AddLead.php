<?php

namespace App\Libraries;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Crm\Leads_Proudct;

trait AddLead
{
    public static function unpublish($id)
    {
        if (Leads_Proudct::where('lead_id_source', $id)->delete()) {
            return true;
        } else {
            return response()->json([
                'success' => false,
                'message' => 'package can not be deleted'
            ], 500);
        }
    }
    public static function publish($id)
    {

        $db = DB::connection('sales');


        //get leads record
        $Lead = $db->table('leads')->where('id', $id)->first();
        if (!$Lead) {
            return response()->json([
                'status' => -1,
                'msg' => 'lead not found'
            ], 400);
        }
        //get company id from proudcy id

        $LeadCompany = $db->table('products')->where('id', $Lead->chosen_product_id)->first();
        if ($LeadCompany) {
            $LeadCompanyId = $LeadCompany->company_id;
        } else {
            $LeadCompanyId = null;
        }
        $LeadLoanAmount = $Lead->loan_amount;
        if ($LeadLoanAmount < 1) {
            //   return ['status' => -2, 'msg' => 'lead amount not vaild'];
           /* return response()->json([
                'status' => -1,
                'amount' => $LeadLoanAmount,
                'msg' => 'lead amount not vaild'
            ], 500);*/
            $LeadLoanAmount  = 0;
        }
        $LeadMonthlyIncome = $Lead->monthly_income;
        if ($LeadMonthlyIncome < 0) {
            /*return response()->json([
                'status' => -1,
                'amount' => $LeadMonthlyIncome,
                'msg' => 'lead Monthly Income not vaild'
            ], 400);*/
            $LeadLoanAmount  = 0;
        }


        //get defult points
        /*$DefultPoints = $db->table('points_evaluate_rule')->where('operand_id', 1)->first();
        if (!$DefultPoints) {
            return response()->json([
                'status' => -1,
                'msg' => 'default points not found'
            ], 400);
        }*/

        $defaultpoints =  5;
        $LoanAmountpoints = 0;
        $MonthlyIncomepoints = 0;
        //get Loan Amount rang point
        $OPLoanAmount = $db->table('points_evaluate_rule')->where('operand_id', 2)
            ->orderBy('add_points', 'DESC')->get();


        foreach ($OPLoanAmount as $ranges => $range) {
            if ($range->operator_name == 'Max') {
                $maxvalue = $range->value1 * 1000;
                if ($LeadLoanAmount >= $maxvalue) {
                    $LoanAmountpoints = $range->add_points;
                    break;
                }
            }
            if ($range->operator_name == 'range') {
                $value1 = $range->value1 * 1000;
                $value2 = $range->value2 * 1000;
                if ($LeadLoanAmount >= $value1 && $LeadLoanAmount <= $value2) {
                    $LoanAmountpoints = $range->add_points;
                    $range->add_points;
                    break;
                }
            }
        }
        // get monthly range points
        $OPMonthlyIncome = $db->table('points_evaluate_rule')->where('operand_id', 3)
            ->orderBy('add_points', 'DESC')->get();

        foreach ($OPMonthlyIncome as $ranges => $range) {
            if ($range->operator_name == 'Max') {
                $maxvalue = $range->value1 * 1000;
                if ($LeadMonthlyIncome >= $maxvalue) {
                    $MonthlyIncomepoints = $range->add_points;
                    break;
                }
            }
            if ($range->operator_name == 'range') {
                $value1 = $range->value1 * 1000;
                $value2 = $range->value2 * 1000;
                if ($LeadMonthlyIncome >= $value1 && $LeadMonthlyIncome <= $value2) {
                    $MonthlyIncomepoints = $range->add_points;
                    $range->add_points;
                    break;
                }
            }
        }
        if ($LoanAmountpoints > 0) {
            $WgLoanAmount = $db->table('operand')->where('id', 2)->first();
            $wgloan = $WgLoanAmount->proportion * $LoanAmountpoints / 100;
        } else {
            $wgloan = 0;
        }
        if ($MonthlyIncomepoints > 0) {
            $WgMonthlyIncome = $db->table('operand')->where('id', 3)->first();
            $wgMonthly = $WgMonthlyIncome->proportion * $MonthlyIncomepoints / 100;
        } else {
            $wgMonthly = 0;
        }

      if ($wgloan  == 0){
        $wgMonthly = 0;
      }

        $selling_value =   $defaultpoints +  round($wgloan + $wgMonthly);


        $leads_proudct = new Leads_Proudct([
            'lead_id_source' => $id,
            'company_id' =>  $LeadCompanyId,
            'status' => 0,
            'selling_value' => $selling_value,

        ]);

        // $leads_proudct->save();
        if ($leads_proudct->save())
            return true;
        else
            return response()->json([
                'status' => -1,
                'msg' => 'leads proudct not added'
            ], 400);
    }
}
