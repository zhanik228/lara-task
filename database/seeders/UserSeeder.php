<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = [
            [
                'username' => 'super-user',
                'email' => 'super-user@mail.ru',
                'password' => Hash::make('password'),
                'is_super' => true,
            ],
            [
                'username' => 'just-user',
                'email' => 'just-user@mail.ru',
                'password' => Hash::make('password'),
                'is_super' => false,
            ]
        ];

        DB::table('users')->insert($users);
    }
}
