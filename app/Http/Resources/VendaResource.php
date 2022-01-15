<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class VendaResource extends JsonResource
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
            'observacao'   => $this->observacao,
            'desconto'     => $this->desconto,
            'total'        => $this->total,
            'quantidade'   => $this->quantidade,
            'created_at'   => $this->created_at,
            'vendaProduto' => VendaProdutoResource::collection($this->vendaProduto),
            'pagamento'    => PagamentoResource::collection($this->pagamento),
        ];
    }
}
