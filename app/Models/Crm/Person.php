<?php

namespace App\Models\Crm;

use Illuminate\Database\Eloquent\Model;


class Person extends Model
{
  
    protected $appends = ['fullname'];
    
    public function getFullnameAttribute()
    {
        return $this->name." 📧 ".$this->email;
    }
    
    protected $connection = 'sales';

    protected $table = 'users';


}
