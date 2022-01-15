<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use phpDocumentor\Reflection\Types\Resource_;

class VendaProdutoResource extends JsonResource
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
            'id'         => $this->id,
            'quantidade' => $this->quantidade,
            'preco'      => $this->preco,
            'produto_id' => $this->produto_id,
            'venda_id'   => $this->venda_id,
            'produto'    => new ProdutoResource($this->produto),
            // 'venda'      => new VendaResource($this->venda)
        ];
    }
}
