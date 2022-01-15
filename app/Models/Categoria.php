<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Categoria extends Model
{
    use HasFactory;
    
    protected $table = 'categoria';
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
     * Scope a query to only include users of a given type.
     *
     * @param  \Illuminate\Database\Eloquent\Builder $query
     * @param  string $nome
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeNome($query, $nome)
    {
        if ($nome == '' || $nome == null) {
            return $query;
        }
        $nomeUpper = '%' . strtoupper($nome) . '%';
        return $query->where(DB::raw('UPPER(nome)'),  'like', $nomeUpper);

    }

    /**
     * Scope a query to only include users of a given type.
     *
     * @param  \Illuminate\Database\Eloquent\Builder $query
     * @param  boolean $ativo
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeAtivo($query, $ativo = true)
    {
        $st_ativo = ($ativo || $ativo === null) ? 1 : 0;
        return $query->where('ativo','=', $st_ativo);
    }
}
