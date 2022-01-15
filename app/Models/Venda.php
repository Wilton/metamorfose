<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venda extends Model
{
    use HasFactory;

    protected $table = 'venda';
    // public $timestamps = false;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'observacao',
        'desconto',
        'total',
        'quantidade',
    ];

    protected $casts = [
        'observacao'  => 'string',
        'desconto'    => 'float',
        'total'       => 'float',
        'quantidade'  => 'integer'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    public function vendaProduto()
    {
        // return $this->hasMany(Produto::class);
        return $this->hasMany(VendaProduto::class);
    }

    public function pagamento()
    {
        return $this->hasMany((Pagamento::class));
    }

    /**
     * Scope a query to only include users of a given type.
     *
     * @param  \Illuminate\Database\Eloquent\Builder $query
     * @param  string $dt_vldd_inicio
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeInicio($query, $inicio)
    {
        if ($inicio == '' || $inicio == null) {
            return $query;
        }

        try {
            $query->where('created_at', '>=' , $inicio);
            return $query;
        } catch(\Exception $e) {
            return $query;
        }
    }

    /**
     * Scope a query to only include users of a given type.
     *
     * @param  \Illuminate\Database\Eloquent\Builder $query
     * @param  string $dt_vldd_inicio
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeFim($query, $fim)
    {
        if ($fim == '' || $fim == null) {
            return $query;
        }

        setlocale(LC_ALL, 'pt_BR', 'pt_BR.utf-8', 'portuguese');
        try {
            $query->where('created_at', '<=' , $fim);
            return $query;
        } catch(\Exception $e) {
            return $query;
        }
    }

}
