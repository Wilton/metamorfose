<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProdutoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'           => $this->id,
            'nome'         => $this->nome,
            'ativo'        => $this->ativo,
            'codigo'       => $this->codigo,
            'descricao'    => $this->descricao,
            'custo'        => $this->custo,
            'preco'        => $this->preco,
            'quantidade'   => $this->quantidade,
            'alerta'       => $this->alerta,
            'categoria_id' => $this->categoria_id,
            'marca_id'     => $this->marca_id,
            'marca'        => new MarcaResource($this->marca),
            'categoria'    => new CategoriaResource($this->categoria),
            // 'vendaProduto' => 
        ];
    }
}
