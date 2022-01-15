<?php

namespace Database\Seeders;

use App\Models\Marca;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MarcaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Marca::factory()->count(50)->create();
        DB::table('marca')->insert([
            'nome'=> 'Tilibra'
        ]);
        DB::table('marca')->insert([
            'nome'=> 'Faber-Castel'
        ]);
        DB::table('marca')->insert([
            'nome'=> 'Chamex'
        ]);
        DB::table('marca')->insert([
            'nome'=> 'Pentel'
        ]);
        DB::table('marca')->insert([
            'nome'=> 'NewPen'
        ]);
        DB::table('marca')->insert([
            'nome'=> 'Stabilo'
        ]);
        DB::table('marca')->insert([
            'nome'=> 'Sestini'
        ]);
        DB::table('marca')->insert([
            'nome'=> 'Staedtler'
        ]);
        DB::table('marca')->insert([
            'nome'=> 'Uni Ball'
        ]);
        DB::table('marca')->insert([
            'nome'=> 'BIC'
        ]);
    }
}
