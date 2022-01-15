<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProdutoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'nome'         =>'required|max:200',
            'codigo'       =>'required|max:45',
            'descricao'    =>'required|max:3000',
            'preco'        =>'required',
            'custo'        =>'required',
            'quantidade'   =>'required|min:1',
            'alerta'       =>'required|min:1',
            'ativo'        =>'required',
            'marca_id'     =>'required|exists:marca,id',
            'categoria_id' =>'required|exists:categoria,id',
        ];
    }

    public function messages()
    {
        return [
            'nome.required'         => 'Este campo é obrigatório',
            'nome.max'              => 'O campo deve ter o tamanho máximo de :max caracteres',
            'codigo.required'       => 'Este campo é obrigatório',
            'codigo.max'            => 'O campo deve ter o tamanho máximo de :max caracteres',
            'descricao.required'    => 'Este campo é obrigatório',
            'descricao.max'         => 'O campo deve ter o tamanho máximo de :max caracteres',
            'preco.required'        => 'Este campo é obrigatório',
            'custo.required'        => 'Este campo é obrigatório',
            'quantidade.required'   => 'Este campo é obrigatório',
            'quantidade.min'        => 'O campo deve ter no mínimo uma unidade',
            'alerta.required'       => 'Este campo é obrigatório',
            'alerta.min'            => 'O campo deve ter no mínimo uma unidade',
            'ativo.required'        => 'Este campo é obrigatório',
            'marca_id.required'     => 'Este campo é obrigatório',
            'marca_id.exists'       => 'Esta [marca] não existe na base de dados',
            'categoria_id.required' => 'Este campo é obrigatório',
            'categoria_id.exists'   => 'Esta [categoria] não existe na base de dados',
        ];
    }
}
