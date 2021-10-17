<?php

namespace App\Http\Controllers\Crm;

use App\Models\Crm\Points;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Libraries\ModelTreatment;
use Illuminate\Support\Facades\DB;


use DateTime;

class PointsController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:read', ['only' => ['index', 'show']]);
        $this->middleware('role:insert', ['only' => ['store']]);
        $this->middleware('role:update', ['only' => ['update', 'multipleUpdate']]);
        $this->middleware('role:delete', ['only' => ['destroy']]);
    }

    private $m = Points::class;
    private $pk = 'id';

    public function index()
    {
        return Points
            ::join('pur_package', 'pur_package.id', '=', 'package.id')
            ->orderBy('pur_package.id', 'asc')
            ->select('pur_package.*')
            ->get();
    }
    public function show($id)
    {
        $PointsInfo = Points
            ::where('id', $id)
            ->first();
        return $PointsInfo;
    }
    public function validRequest(Request $request)
    {
        $request->validate([
            'package_id' => 'required|int',
            'user_id' => 'required|int',
        ]);
    }
    public function update(Request $request)
    {


        return [
            'status' => -1,
            'msg' => "not allowed to update record"
        ];
    }
    public function store(Request $request)
    {
        $dbsales = DB::connection("sales");
        //$this->validRequest($request);
        //get package  points
        $packageinfo =  $dbsales->table('package')->where('id', $request->get('package_id'))->first();
        if (!$packageinfo) {
            return [
                'status' => -1,
                'msg' => 'package not found'
            ];
        } else {
            $package_points = $packageinfo->package_points;
        }
        //  check package if active
        if ($packageinfo->status != 0) {
           return [
                'status' => -1,
                'msg' => 'can not buy this package'
           ];
        }

        
            $dt = new DateTime();
            $dt->format('Y-m-d H:i:s');
            $pur_date = $dt;
            $order_nr = time() . rand(10 * 45, 100 * 98);

        
        $Points = new Points([
            'package_id' => $request->get('package_id'),
            'user_id' => $request->get('user_id'),
            'package_points' => $package_points,
            'pur_date' => $pur_date,
            'order_nr'=>$order_nr,


        ]);

        // $Points->save();
        if ($Points->save())
            return [
                'status' => 0,
                'msg' => "Saved"
            ];
        else
            return [
                'status' => -1,
                'msg' => 'can not do this action'
            ];
    }
    public function destroy($id)
    {
        $Points = Points::find($id);

        if (!$Points) {
            return [
                'status' => -1,
                'msg' => 'record not found'
            ];
        }

        if ($Points->delete()) {
            return [
                'status' => 0
            ];
        } else {
            return [
                'status' => -1,
                'msg' => 'record can not be deleted'
            ];
        }
    }
    public function search(Request $request)
    {
        $columns = ['pur_package.id', 
        'pur_package.user_id','pur_package.order_nr',
         'pur_package.pur_date', 'pur_package.order_nr'
        , 'pur_package.updated_at', 'pur_package.created_at', 'pur_package.package_points',
        'package.package_price','package.package_name'
       ,'users.name','users.email'];
        $model =
         Points::select($columns)
         ->leftJoin('package', 'package.id', '=', 'pur_package.package_id')
        ->leftJoin('users','users.id','=','pur_package.user_id')
        ->orderBy('pur_package.pur_date', 'DESC');
        return ModelTreatment::getAsyncData($model, $request, $columns, 'crm', 'pur_package', 'pur_package.id', 'ASC');
    }
}
 