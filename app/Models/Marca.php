<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Marca extends Model
{
    use HasFactory;

    protected $table = 'marca';
    public $timestamps = false;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nome',
        'ativo',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    public function produto()
    {
        return $this->hasMany(Produto::class);
    }

    /**
     * Filtrando uma query para apenas uma categoria
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  string $nome
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeNome(Builder $query, $nome) 
    {
        if (!empty($nome) && $nome != null) {
            $nomeUpper = '%' . strtoupper($nome) . '%';
            $query->where(DB::raw('UPPER(nome)'),  'like', $nomeUpper);
        }
        return $query;
    }

    /**
     * Filtrando a query para apenas uma marca
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeAtivo(Builder $query, $ativo = true) 
    {
        return $query->where('ativo', ($ativo === false? 0 : 1));
    }


}

