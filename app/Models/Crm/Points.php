<?php

namespace App\Models\Crm;
use App\Models\Crm\Package;

use Illuminate\Database\Eloquent\Model;


class Points extends Model
{

    protected $fillable = [

        'package_id',
        'user_id',
        'pur_date',
        'package_points',
        'order_nr'
    ];

 
    public function Package()
    {
        return $this->belongsTo(Package::class);
    }
    protected $connection = 'sales';

    protected $table = 'pur_package';
}
