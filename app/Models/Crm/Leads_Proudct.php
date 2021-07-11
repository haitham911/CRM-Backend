<?php

namespace App\Models\Crm;

use Illuminate\Database\Eloquent\Model;

class Leads_Proudct extends Model
{

    protected $fillable = [
        'lead_id_source',
        'status',
        'selling_value',
        'pru_count',
        'company_id',
        'updated_at',
        'created_at'

    ];

    protected $connection = 'sales';
    protected $table = 'leads_proudct';
}
