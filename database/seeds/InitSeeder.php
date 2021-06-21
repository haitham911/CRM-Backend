<?php

use Illuminate\Database\Seeder;
use App\Models\Admin\User;

class InitSeeder extends Seeder
{
    public function run()
    {

        DB::table('user_types')
        ->insert([
            [
                'name' => 'Guest',
                'read' => true,
                'insert' => false,
                'update' => false,
                'delete' => false,
                'admin' => false,
                'active' => true,
            ],
            [
                'name' => 'User',
                'read' => true,
                'insert' => true,
                'update' => true,
                'delete' => true,
                'admin' => false,
                'active' => true,
            ],
            [
                'name' => 'Admin',
                'read' => true,
                'insert' => true,
                'update' => true,
                'delete' => true,
                'admin' => true,
                'active' => true,
            ]
        ]);

        DB::table('users')
        ->insert([
            [
                'name' => 'admin',
                'email' => 'admin@admin.com',
                'password' => bcrypt('1234'),
                'user_type_id' => 3
            ]
        ]);

        DB::table('permissions')
        ->insert([
            [
                'name' => 'CRM',
                'code' => 'CRM',
                'path' => 'crm'
            ],
            [
                'name' => 'administracja',
                'code' => 'ADMIN',
                'path' => 'admin'
            ]
        ]);

        DB::table('user_permissions')
        ->insert([
            ['user_id' => 1,'permission_id' => 1],
            ['user_id' => 1,'permission_id' => 2]
        ]);

      

       
    }
}
