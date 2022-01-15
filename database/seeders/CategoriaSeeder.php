<?php

namespace Database\Seeders;

use App\Models\Categoria;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategoriaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Categoria::factory()->count(10)->hasProduct(30)->create();
        DB::table('categoria')->insert([
            'nome'=> 'Papelaria'
        ]);
        DB::table('categoria')->insert([
            'nome'=> 'Eletrônicos'
        ]);
        DB::table('categoria')->insert([
            'nome'=> 'Informática'
        ]);
        DB::table('categoria')->insert([
            'nome'=> 'Brinquedos'
        ]);
    }
}
