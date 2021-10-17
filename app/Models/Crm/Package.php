<?php

namespace App\Models\Crm;

use Illuminate\Database\Eloquent\Model;


class Package extends Model
{

    protected $fillable = [

        'active',
        
    ];
    
// {$this->package_price}
    public static $validator = [

        'active' => 'boolean'
    ];

    protected $appends = ['full_name'];
    public function getFullNameAttribute(){
      return  "{$this->package_name} 📦  {$this->package_points} 💲 {$this->package_price} ";
     }
    protected $connection = 'sales';

    protected $table = 'package';
}
