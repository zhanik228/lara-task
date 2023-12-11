<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class LinkSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $links = [
            [
                'user_id' => 2,
                'original_link' => 'https://github.com/zhanik228',
                'token' => Str::random(10),
                'private_token' => Str::random(10),
                'is_private' => true,
            ],
            [
                'user_id' => 2,
                'original_link' => 'https://github.com/',
                'token' => Str::random(10),
                'private_token' => null,
                'is_private' => false,
            ],
        ];

        DB::table('links')->insert($links);
    }
}
