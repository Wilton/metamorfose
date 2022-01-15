<?php

namespace Database\Seeders;

use App\Models\Categoria;
use App\Models\Marca;
use App\Models\Produto;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProdutoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Produto::factory()->count(100)->create();
        $this->call(TipoPagamentoSeeder::class);
        $this->call(CategoriaSeeder::class);
        $this->call(MarcaSeeder::class);
        DB::table('produto')->insert([
            'nome' => 'Lapiseira Acqua 0.7mm',
            'ativo' => 1,
            'codigo' => '1',
            'descricao' => 'A Lapiseira 0.7mm i-Point Aqua possui um mecanismo de qualidade para armazenamento e avanço da carga oferecendo praticidade ao escrever e desenhar, além de ser indispensável para realizar suas atividades

            - Com clip
            - Cor: Aqua
            - Design moderno
            - Grip ergonômico
            - Maior praticidade ao escrever
            - Maior resistência e durabilidade
            - Ponta: 0.7mm
            - Traço macio',
            'custo' => 7.90,
            'preco' => 9.90,
            'quantidade' => 20,
            'alerta' => 2,
            'categoria_id' => 2,
            'marca_id' => 1,
        ]);
        DB::table('produto')->insert([
            'nome' => 'Lapiseira Apollo Faber-Castell Com Grafite 0.7',
            'ativo' => 1,
            'codigo' => '2',
            'descricao' => 'Lapiseira Apollo, a lapiseira clássica e chic da Faber Castell!!

            - Corpo ergonômico com pega emborrachada.
            - Acabamento metálico.
            - Borracha com sistema de extensão.
            - Evite temperaturas acima de 45°C e exposição direta aos raios solar.
            - Armazenar em lugar seco e ventilado.
            - Produto não perecível e atóxico.
            - Acompanha 1 grafite 0.7 mm ',
            'custo' => 15.00,
            'preco' => 25.00,
            'quantidade' => 20,
            'alerta' => 2,
            'categoria_id' => 2,
            'marca_id' => 2,
        ]);
    }
}
