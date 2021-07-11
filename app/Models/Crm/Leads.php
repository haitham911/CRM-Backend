<?php

namespace App\Models\Crm;

use Illuminate\Database\Eloquent\Model;


class Leads extends Model
{

    protected $fillable = [

        'active',
    ];

    public static $validator = [

        'active' => 'boolean'
    ];
    protected $connection = 'sales';

    protected $table = 'leads';
}
