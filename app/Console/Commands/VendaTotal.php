<?php

namespace App\Console\Commands;

use App\Models\Venda;
use App\Models\VendaProduto;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class VendaTotal extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'vendas:total';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Preenche o atributo total na tabela de vendas';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $vendas = Venda::where('total', '<', 1)->get();
        $bar = $this->output->createProgressBar(count($vendas));
        $bar->start();
        foreach($vendas as $venda) {
            $total = number_format(VendaProduto::where('venda_id', $venda->id)->sum(DB::raw('preco * quantidade')), 2);
            $quantidade = (int) VendaProduto::where('venda_id', $venda->id)->sum('quantidade');
            // $this->line("total {$total}");
            // $this->line("quantidade {$quantidade}");
            $venda->total = $total;
            $venda->quantidade = $quantidade;
            $venda->save();
            $bar->advance();
        }
        $bar->finish();
    }
}
