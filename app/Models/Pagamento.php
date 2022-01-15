<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pagamento extends Model
{
    use HasFactory;

    protected $table = 'pagamento';
    // public $timestamps = false;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'valor',
        'parcelas',
        'tipo_pagamento_id'
    ];

    protected $casts = [
        'parcelas'  => 'integer',
        'valor'    => 'float',
    ];

    public function tipoPagamento() {
        return $this->belongsTo(TipoPagamento::class);
    }
}
