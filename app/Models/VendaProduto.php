<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VendaProduto extends Model
{
    use HasFactory;

    protected $table = 'venda_produto'; 

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'quantidade',
        'preco',
        'produto_id',
        'venda_id',
    ];

    protected $casts = [
        'quantidade' => 'integer',
        'preco'      => 'float',
        'produto_id' => 'integer',
        'venda_id'   => 'integer',
    ];

    public function produto()
    {
        return $this->belongsTo(Produto::class);
    }

    public function venda()
    {
        return $this->belongsTo(Venda::class);
    }

}