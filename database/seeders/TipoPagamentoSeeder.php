<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TipoPagamentoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_pagamento')->insert([
            'descricao' => 'Dinheiro',
        ]);
        DB::table('tipo_pagamento')->insert([
            'descricao' => 'PIX',
        ]);
        DB::table('tipo_pagamento')->insert([
            'descricao' => 'Débito',
        ]);
        DB::table('tipo_pagamento')->insert([
            'descricao' => 'Crédito',
        ]);
        DB::table('tipo_pagamento')->insert([
            'descricao' => 'Outros',
        ]);
    }
}
