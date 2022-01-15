<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class Produto extends Model
{
    use HasFactory;

    protected $table = 'produto';
    public $timestamps = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nome',
        'ativo',
        'codigo',
        'descricao',
        'custo',
        'preco',
        'quantidade',
        'alerta',
        'categoria_id',
        'marca_id',
    ];

    protected $casts = [
        'nome'       => 'string',
        'ativo'      => 'integer',
        'codigo'     => 'string',
        'descricao'  => 'string',
        'custo'      => 'float',
        'preco'      => 'float',
        'quantidade' => 'integer',
        'alerta'     => 'integer',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

    public function marca()
    {
        return $this->belongsTo(Marca::class);
    }

    public function categoria() 
    {
        return $this->belongsTo(Categoria::class);
    }

    public function vendaProduto()
    {
        return $this->belongsToMany(VendaProduto::class);
    }

    /**
     * Filtrando a query para apenas uma marca
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeAlerta(Builder $query) 
    {
        return $query
            ->whereNotNull('quantidade')
            ->whereNotNull('alerta')
            ->where('quantidade','<=', 'alerta');
    }

    /**
     * Filtrando a query para apenas uma marca
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeAtivo(Builder $query) 
    {
        return $query->where('ativo', 1);
    }

    /**
     * Filtrando a query para apenas uma marca
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  integer $marca_id
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeByMarca(Builder $query, $marca_id) 
    {
        if (!empty($marca_id) && $marca_id != null) {
            $query->where('marca_id', $marca_id);
        }
        return $query;
    }

    /**
     * Filtrando uma query para apenas uma categoria
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  integer $categoria_id
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeByCategoria(Builder $query, $categoria_id) 
    {
        if (!empty($categoria_id) && $categoria_id != null) {
            $query->where('categoria_id', $categoria_id);
        }
        return $query;
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
     * Filtrando uma query para apenas uma categoria
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  string $descricao
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeDescricao(Builder $query, $descricao) 
    {
        if (!empty($descricao) && $descricao != null) {
            $descricaoUpper = '%' . strtoupper($descricao) . '%';
            $query->where(DB::raw('UPPER(descricao)'),  'like', $descricaoUpper);
        }
        return $query;
    }

    /**
     * Filtrando uma query para apenas uma categoria
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  string $codigo
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeCodigo(Builder $query, $codigo) 
    {
        if ($this->ean($codigo)) {
            $query->where('codigo', $codigo);
        }

        return $query;
    }

    /**
     * Determine if the value is a valid EAN
     * @public function ean
     *
     * @param $value
     *
     * @return bool
     * @throws Exception
     */
    public function ean($value): bool
    {

        // EANs are either eight or thirteen chars long and only contain numbers
        if (!preg_match('/^[0-9]{8}$|^[0-9]{13}$/', $value)) {
            return false;
        }

        $length = Str::length($value);

        // Okay its the right length, pop off the check digit so we can look only at the data portion separately
        $data        = Str::substr($value, 0, $length - 1);
        $check_digit = (int)Str::substr($value, $length - 1);

        // if the check digit is correct, we can accept the value :)
        return $this->calculateCheckDigit($data) === $check_digit;
    }


    /**
     * Calculate an EAN check digit given a 7 or 12 character string of digits
     *
     * function calculateCheckDigit
     *
     * @param string $data
     *
     * @return int
     * @throws Exception
     */
    private function calculateCheckDigit(string $data): int
    {
        if (!preg_match('/^[0-9]{7}$|^[0-9]{12}$/', $data)) {
            return false;
        }

        // build a sum by adding digit * 3 if in odd position, or just the value of digit if in even position
        $check_sum = 0;
        foreach (str_split($data) as $index => $digit) {
            if ((int)$digit > 0) {
                $check_sum += $index % 2 === 0 ? (int)$digit : (int)$digit * 3;
            }
        }

        // subtract this sum from the next multiple of ten and that's your check digit!
        return ((int)ceil($check_sum / 10) * 10) - $check_sum;
    }
}
