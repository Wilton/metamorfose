<template>
  <v-container fluid class="elements-page mt-3">
    <v-row>
      <v-col cols="12" md="8">
        <v-card  style="height: calc(100vh - 110px);">
          <v-card-title>
            Venda / Orçamento
            <v-spacer></v-spacer>
            <v-text-field v-model="search" append-icon="mdi-magnify" label="Pesquisar por nome" single-line hide-details ></v-text-field>
          </v-card-title>
          <v-card-text style="height: calc(100vh - 190px);">
            <v-data-table dense :search="search" height="calc(100vh - 277px)" hide-default-footer :items-per-page="-1" :headers="headers" :items="items" class="elevation-0">
              <template v-slot:item.id="{ item }">
                <v-btn icon @click.stop="editar(item)"><v-icon color="yellow darken-2">mdi-pencil</v-icon></v-btn>
                <v-btn icon @click.stop="excluir(item)"><v-icon color="red darken-2">mdi-trash-can</v-icon></v-btn> 
                {{ items.indexOf(item) +1 }}
              </template>
              <template v-slot:item.marca="{ item }">
                {{ item.marca.nome }}
              </template>
              <template v-slot:item.categoria="{ item }">
                {{ item.categoria.nome }}
              </template>
              <template v-slot:item.preco="{ item }">
                {{ item.preco | dinheiro }}
              </template>
              <template v-slot:item.total="{ item }">
                {{ item.total | dinheiro }}
              </template>
            </v-data-table>
            <v-divider></v-divider>
            <v-form>
              <v-row>
                <v-spacer></v-spacer>
                <v-col cols="12" md="2">
                  <v-list-item two-line>
                    <v-list-item-content>
                      <v-list-item-title class="text-right"><span class="display-1 font-weight-black blue--text text--darken-3">{{ totalItems }}</span></v-list-item-title>
                      <v-list-item-subtitle class="text-right">Itens</v-list-item-subtitle>
                    </v-list-item-content>
                  </v-list-item>
                </v-col>
                <v-col cols="12" md="3">
                  <v-list-item two-line>
                    <v-list-item-content>
                      <v-list-item-title class="text-right"><span class="display-1 font-weight-black blue--text text--darken-3">R$ {{ total | dinheiro}}</span></v-list-item-title>
                      <v-list-item-subtitle class="text-right">Total</v-list-item-subtitle>
                    </v-list-item-content>
                  </v-list-item>
                </v-col>
              </v-row>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="12" md="4">
        <v-tabs v-model="tab" icons-and-text grow>
          <v-tab>
            Produto
            <v-icon>mdi-plus-box-multiple-outline</v-icon>
          </v-tab>
          <v-tab>
            Pesquisar
            <v-icon>mdi-magnify</v-icon>
          </v-tab>
          <v-tab>
            Pagamento
            <v-icon>mdi-credit-card-check</v-icon>
          </v-tab>
          <v-tabs-items v-model="tab">
            <v-tab-item>
              <v-card :loading="loading" style="height: calc(100vh - 245px);">
                <v-card-text style="height: calc(100vh - 367px);">
                  <v-form>
                    <v-row>
                      <v-col cols="12" md="11">
                        <v-text-field :loading="loadingCodigo" id="codigo" v-model="pesquisa.codigo" @keyup.enter="pesquisarProdutoPorCodigo()" label="Codigo"></v-text-field>
                      </v-col>
                      <v-col cols="12" md="1">
                        <v-btn icon @click="pesquisarProdutoPorCodigo()">
                          <v-icon color="blue darken-2">mdi-magnify</v-icon>
                        </v-btn>
                      </v-col>  
                    </v-row>
                    <v-row v-if="produtoSelecionado">
                      <v-card outlined shaped >
                        <v-card-subtitle v-if="produtoSelecionado">Produto encontrado</v-card-subtitle>
                        <v-card-text>
                          <v-col cols="12" md="12">
                            <v-list-item three-line>
                              <v-list-item-content>
                                <v-list-item-title>
                                  <span class="body-1 font-weight-medium blue--text text--darken-3">
                                    {{ form.nome }} - {{ form.marca.nome }}
                                  </span>
                                </v-list-item-title>
                                <v-list-item-subtitle>
                                  <span class="body-2 font-weight-medium">
                                  {{ form.descricao }}
                                  </span>
                                </v-list-item-subtitle>
                                <v-list-item-subtitle>
                                  <v-chip color="black" outlined>R$ {{ form.preco | dinheiro }}</v-chip>
                                  <v-chip color="blue darken-3" outlined class="mx-2">
                                    <v-icon left>mdi-label</v-icon>{{ form.categoria.nome }}
                                  </v-chip>
                                </v-list-item-subtitle>
                              </v-list-item-content>
                            </v-list-item>
                          </v-col>
                          <v-divider></v-divider>
                          <v-row v-if="produtoSelecionado">
                            <v-col cols="12" md="3">
                              <v-text-field v-model="form.quantidade_produto" label="Quantidade" ref="form_quantidade_produto"></v-text-field>
                            </v-col>
                            <v-col cols="12" md="4">
                              <v-text-field readonly :value="precoFormatado" label="Preço"></v-text-field>
                            </v-col>
                            <v-col cols="12" md="5">
                              <v-text-field reaonly :value="totalParcial" label="Total Parcial"></v-text-field>
                            </v-col>
                          </v-row>
                        </v-card-text>
                        <v-card-actions>
                          <v-btn class="white--text" color="indigo" @click="addProduto()">
                            <v-icon color="white">mdi-plus</v-icon>
                            Adicionar Produto
                          </v-btn>
                        </v-card-actions>
                      </v-card>
                    </v-row>
                  </v-form>
                </v-card-text>
              </v-card>           
            </v-tab-item>
            <v-tab-item>
              <v-card :loading="loading" style="height: calc(100vh - 245px);">
                <v-card-text style="height: calc(100vh - 367px);">
                  <v-form>
                    <v-row>
                      <v-col cols="12" md="4">
                        <v-combobox dense v-model="pesquisa.marca" :items="marcas" item-text="nome" item-value="id" label="Marca"></v-combobox>
                      </v-col>
                      <v-col cols="12" md="7">
                        <v-text-field dense v-model="pesquisa.nome" label="Nome"></v-text-field>
                      </v-col>
                      <v-col cols="12" md="1">
                        <v-btn icon dense @click="pesquisarProduto()">
                          <v-icon color="blue darken-2">mdi-magnify</v-icon>
                        </v-btn>
                      </v-col>                
                    </v-row>
                    <v-row>
                      <v-simple-table fixed-header height="500px">
                        <template v-slot:default>
                          <thead>
                            <tr>
                              <th class="text-left">Selecionar</th>
                              <th class="text-left">Nome</th>
                              <th class="text-left">Marca</th>
                              <th class="text-left">Preço</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr v-for="item in itemsPesquisa" :key="item.id">
                              <td>
                                <v-tooltip bottom>
                                  <template v-slot:activator="{ on, attrs }">
                                    <v-btn icon  v-bind="attrs" v-on="on" @click="addProdutoPesquisado(item)">
                                      <v-icon color="blue darken-2">mdi-send-check</v-icon>
                                    </v-btn>
                                  </template>
                                  <span>Selecionar Produto</span>
                                </v-tooltip>
                              </td>
                              <td>{{ item.nome }}</td>
                              <td>{{ item.marca.nome }}</td>
                              <td>{{ item.preco | dinheiro}}</td>
                            </tr>
                          </tbody>
                        </template>
                      </v-simple-table>
                    </v-row>
                  </v-form>
                </v-card-text>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card :loading="loading" class="overflow-y-auto">
                <v-card-text>
                  <div class="mb-16">
                    <v-tooltip bottom v-for="(tp, index) in tiposPagamentosButtons" :key="index">
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn @click="addPagamento(tp.tipo_pagamento_id)" class="mx-2" fab dark large :color="tp.color" v-bind="attrs" v-on="on">
                          <v-icon dark>{{ tp.icon }}</v-icon>
                        </v-btn>
                      </template>
                      <span>{{ tp.desc }}</span>
                    </v-tooltip>
                  </div>
                  <v-form>
                    <v-row v-for="(pg,index) in pagamentos.items" :key="index">
                      <v-col cols="12" md="3">
                        <v-chip :color="pg.color" text-color="white" close close-icon="mdi-delete" @click:close="removerPagamento(index)">
                          <v-avatar left>
                            <v-icon>{{ pg.icon }}</v-icon>
                          </v-avatar>
                          {{ pg.desc }}
                        </v-chip>
                      </v-col>
                      <v-col cols="12" md="6">
                        <v-text-field dense v-model.lazy="pg.valor_ptb" v-money="money" label="Valor" ref="input_valor"></v-text-field>
                      </v-col>
                      <v-col cols="12" md="3" v-if="'parcelas' in pg">
                        <v-text-field type="number" dense v-model="pg.parcelas" label="Parcelas"></v-text-field>
                      </v-col>
                    </v-row>
                    <v-row class="justify-end">
                      <v-col cols="12" md="12">
                        <v-expansion-panels focusable>
                          <v-expansion-panel>
                            <v-expansion-panel-header>Outros</v-expansion-panel-header>
                            <v-expansion-panel-content>
                              <v-row>
                                <v-spacer></v-spacer>
                                <v-col cols="12" md="3" class="my-2">
                                  <v-text-field v-model.lazy="venda.desconto" v-money="money" label="Desconto"></v-text-field>
                                </v-col>
                              </v-row>
                              <v-row>
                                <v-col cols="12" md="12">
                                  <v-textarea dense v-model="venda.observacao" label="Observação" counter rows="3"></v-textarea>
                                </v-col>
                              </v-row>
                            </v-expansion-panel-content>
                          </v-expansion-panel>
                        </v-expansion-panels>
                      </v-col>
                    </v-row>                    
                    <v-row class="justify-end">
                      <v-col cols="12" md="3">
                        <v-list-item two-line>
                          <v-list-item-content>
                            <v-list-item-title class="text-right"><span class="body-1 font-weight-black blue--text text--darken-3">{{ totalItems }}</span></v-list-item-title>
                            <v-list-item-subtitle class="text-right">Itens</v-list-item-subtitle>
                          </v-list-item-content>
                        </v-list-item>
                      </v-col>
                      <v-col cols="12" md="4">
                        <v-list-item two-line>
                          <v-list-item-content>
                            <v-list-item-title class="text-right"><span class="body-1 font-weight-black blue--text text--darken-3">R$ {{ total | dinheiro}}</span></v-list-item-title>
                            <v-list-item-subtitle class="text-right">Total da Venda</v-list-item-subtitle>
                          </v-list-item-content>
                        </v-list-item>
                      </v-col>
                      <v-col cols="12" md="5">
                        <v-list-item two-line>
                          <v-list-item-content>
                            <v-list-item-title class="text-right"><span class="body-1 font-weight-black blue--text text--darken-3">R$ {{ totalPagamentos | dinheiro }}</span></v-list-item-title>
                            <v-list-item-subtitle class="text-right">Total Pagamentos</v-list-item-subtitle>
                          </v-list-item-content>
                        </v-list-item>
                      </v-col>
                    </v-row>
                  </v-form>
                </v-card-text>
                <v-card-actions class="justify-end">
                  <v-spacer></v-spacer>
                  <v-btn color="primary" @click="concluir()">
                    <v-icon>mdi-check</v-icon>
                    Concluir
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-tab-item>            
          </v-tabs-items>
        </v-tabs>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
// import { limparForm } from "../utils/limparForm"
import { toFloat } from "../utils/toFloat"
import {VMoney} from 'v-money'
import createNumberMask from 'text-mask-addons/dist/createNumberMask';
import ProdutoService from "../services/ProdutoService"
import MarcaService from '../services/MarcaService';
import VendaService from "../services/VendaService"
import { messages } from "./../utils/messages"
import vendaMixin from "./../mixins/vendaMixin"


const currencyMask = createNumberMask({
  prefix: '',
  allowDecimal: true,
  includeThousandsSeparator: true,
  decimalSymbol: ',',
  allowNegative: false,
  allowLeadingZeroes: true,
  integerLimit: 5
});

export default {
  mixins: [vendaMixin],
  name: "Venda",
  data: () => ({
    mask: currencyMask,
    money: {
      decimal: ',',
      thousands: '.',
      prefix: '',
      // suffix: ' #',
      precision: 2,
      masked: false /* doesn't work with directive */
    },
    // formErrorEvent: false,
    dialog: false,
    dialogEdit: false,
    loading: false,
    loadingCodigo: false,
    tab: null,
    menu_from: false,
    menu_to: false,
    modal: false,
    search: '',
    produtoSelecionado: false,
    options: {
      'page': 1,
      'sortBy': 'id',
      'sortType': 'asc',
      'per_page': 15 
    },
    pesquisa: {
      codigo: '',
      nome: '',
      marca_id: '',
      marca: ''
    },
    form: {
      id: '',
      nome: '',
      ativo: '',
      codigo: '',
      descricao: '',
      marca: '',
      categoria: '',
      custo: '',
      preco: '',
      quantidade: '',
      quantidade_alerta: '',
      quantidade_produto: '',
      total_parcial: '',
    },
    formEdit: {
      nome: '',
      codigo: '',
      descricao: '',
      marca: '',
      categoria: '',
      custo: '',
      preco: '',
      quantidade: '',
      quantidade_alerta: ''
    },
    errors: {},
    marcas: [],
    categorias: [],
    headers: [
      {
        text: '',
        value: 'id',
        sortable: true,
        // hidden: true
      },
      {
        text: 'Código',
        value: 'codigo',
        align: 'left',
        sortable: true
      },
      {
        text: 'Nome',
        value: 'nome',
        align: 'left',
        sortable: true
      },
      {
        text: 'Marca',
        value: 'marca',
        align: 'left',
        sortable: true
      },
      {
        text: 'Preço',
        value: 'preco',
        align: 'left',
        sortable: true
      },
      {
        text: 'Quantidade',
        value: 'quantidade',
        align: 'left',
        sortable: true
      },
      {
        text: 'Total',
        value: 'total',
        align: 'left',
        sortable: true
      }

    ],
    items: [],
    itemsPesquisa: [],
    tiposPagamento: [
      {nome: 'Dinheiro', id: 1},
      {nome: 'Pix', id: 2},
      {nome: 'Cartão de Débito', id: 3},
      {nome: 'Cartão de Crédito', id: 4},
      {nome: 'Outros', id: 5},
    ],
    tiposPagamentoDescricao: {
      dinheiro: 1,
      pix: 2,
      debito: 3,
      credito: 4,
      outros: 5
    },
    tiposPagamentosButtons: [
      {
        desc: 'Dinheiro',
        icon: 'mdi-cash-multiple',
        color: 'primary',
        valor_ptb: '',
        valor: '',
        tipo_pagamento_id: 1
      },
      {
        desc: 'Pix',
        icon: 'mdi-qrcode-plus',
        color: 'indigo',
        valor_ptb: '',
        valor: '',
        tipo_pagamento_id: 2
      },
      {
        desc: 'Débito',
        icon: 'mdi-credit-card',
        color: 'teal',
        valor_ptb: '',
        valor: '',
        tipo_pagamento_id: 3
      },
      {
        desc: 'Crédito',
        icon: 'mdi-credit-card-multiple',
        color: 'purple',
        valor_ptb: '',
        valor: '',
        parcelas: '',
        tipo_pagamento_id: 4
      },
      {
        desc: 'Outros',
        icon: 'mdi-star',
        color: 'pink',
        valor_ptb: '',
        valor: '',
        tipo_pagamento_id: 5
      }
    ],
    pagamentos: {
      items: [],
      venda_id: ''
    },
    venda: {
      desconto: '',
      observacao: '',
    },
  }),
  created() {
    this.listarMarca()
  },
  methods: {
    pesquisarProduto() {
      this.loading = true
      let data = {
        marca_id: this.pesquisa.marca.id || '',
        nome:     this.pesquisa.nome || '',
        codigo:   this.pesquisa.codigo || ''
      }
      // console.log(data)
      let produtoService = new ProdutoService()
      produtoService.pesquisar(this.options, data).then(res => {
        this.itemsPesquisa = res.data.data
        this.loading = false
      })
    },
    pesquisarProdutoPorCodigo() {
      this.loadingCodigo = true
      let produtoService = new ProdutoService()
      produtoService.pesquisar(this.options, {"codigo": this.pesquisa.codigo}).then(res => {
        this.form = res.data.data[0]
        this.form.quantidade_produto = 1
        this.form.total_parcial = this.form.quantidade_produto * this.form.preco
        this.produtoSelecionado = true
        this.loadingCodigo = false
      })
    },
    listarMarca() {
      this.loading = true
      let marcaService = new MarcaService()
      marcaService.paginate().then(res => {
        let dados = res.data.data
        console.log(res)
        this.marcas = dados
        this.loading = false
      })
    },
    addProduto () {
      let o = JSON.parse(JSON.stringify(this.form))
      o.id = this.items.length +1
      o.total = o.preco * o.quantidade_produto
      o.quantidade = o.quantidade_produto
      this.items = [o].concat(this.items)
      this.produtoSelecionado = false
      document.getElementById('codigo').focus()
      this.clearForm(this.pesquisa)
    },
    addProdutoPesquisado (item) {
      this.form.id = item.id
      this.form.nome = item.nome
      this.form.ativo = item.ativo
      this.form.codigo = item.codigo
      this.form.descricao = item.descricao
      this.form.marca = item.marca
      this.form.categoria = item.categoria
      this.form.custo = item.custo
      this.form.preco = item.preco
      this.form.quantidade = item.quantidade
      this.form.quantidade_alerta = item.quantidade_alerta
      this.form.quantidade_produto = 1
      this.form.total_parcial = item.preco
      this.produtoSelecionado = true
      this.tab = 0
      this.$refs.form_quantidade_produto.focus()
    },
    calcularTotalParcial() {
      this.form.total_parcial = parseFloat(this.form.preco * this.form.quantidade_produto)
    },
    addPagamento(tipo) {
      this.pagamentos.items.push(this.tiposPagamentosButtons[tipo -1]);
      setTimeout(() => {
        let index = this.pagamentos.items.length -1
        this.$refs.input_valor[index].focus()
      }, 250)
    },
    removerPagamento(index) {
      this.pagamentos.items.splice(index, 1);
    },
    editar(item) {
      this.form = item
      this.produtoSelecionado = true
      this.excluir(item)
      this.tab = 0
      setTimeout(() => {
        this.$refs.form_quantidade_produto.focus()
      }, 250)
    },
    excluir(item) {
      let index = this.items.indexOf(item)
      this.items.splice(index, 1)
    },
    concluir() {
      let dados = {}
      dados.venda = this.venda
      dados.venda.desconto = (this.venda.desconto) ? parseFloat(this.venda.desconto) : 0.00
      dados.pagamentos = []
      this.pagamentos.items.forEach((pg) => {
        let p = {}
        p.tipo_pagamento_id = pg.tipo_pagamento_id
        p.valor = pg.valor
        if ('parcelas' in pg) {
          p.parcelas = pg.parcelas
        }
        dados.pagamentos.push(p)
      })
      dados.items = []
      this.items.forEach((item) => {
        let dado = {}
        dado.produto_id = item.id
        dado.quantidade = item.quantidade
        dado.preco = item.preco
        dados.items.push(dado)
      })

      let vendaService = new VendaService()
      vendaService.create(dados).then((res) => {
        console.log(res)
        this.success(messages.CADASTRO_SUCESSO)
        this.items = []
        this.venda.desconto = ''
        this.venda.observacao = ''
        this.pagamentos.items = []

      })
    }
  },
  computed: {
    total: function () {
      var t = 0;
      this.items.forEach((item) => {
        t += (item.quantidade * item.preco)
      })
      
      return t
    },
    totalParcial() {
      return (this.form.quantidade_produto * this.form.preco).toLocaleString('pt-br', {minimumFractionDigits: 2});
    },
    totalPagamentos() {
      var t = 0;

      this.pagamentos.items.forEach((item, index) => {
        if (item.valor_ptb != '') {
          let valor = toFloat(item.valor_ptb)
          this.pagamentos.items[index].valor = valor
          t += valor
        }
      })
      if (this.venda.desconto) {
        t += toFloat(this.venda.desconto)
      }
      return t.toFixed(2)
    },
    precoFormatado() {
      return parseFloat(this.form.preco).toLocaleString('pt-br', {minimumFractionDigits: 2});
    },
    totalItems() {
      let t = 0
      this.items.forEach((item) => {
        t += parseInt(item.quantidade)
      })
      return t
    }
  },
  filters: {
    dinheiro (value) {
      if (!value) return ''
      return parseFloat(value).toLocaleString('pt-br', {minimumFractionDigits: 2});
    }
  },
  directives: {money: VMoney}
};
</script>
