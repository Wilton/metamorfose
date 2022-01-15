<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PagamentoResource extends JsonResource
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
            'id'                => $this->id,
            'valor'             => $this->valor,
            'parcelas'          => $this->parcelas,
            'tipo_pagamento_id' => $this->tipo_pagamento_id,
            'tipoPagamento'     => new TipoPagamentoResource($this->tipoPagamento),
        ];
    }
}
