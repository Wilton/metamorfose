<template>
  <v-container fluid class="elements-page mt-3">
    <v-row>
      <v-col cols="12" md="10">

        <v-card>
          <v-card-title>Relatório de vendas</v-card-title>
          <v-card-text>
            <v-data-table :options.sync="options" :server-items-length="totalItems" :loading="loading" :expanded.sync="expanded" show-expand :items-per-page="15" height="700" :headers="headers" :items="items" class="elevation-0">
              <template v-slot:item.desconto="{ item }">
                {{ item.desconto | dinheiro }}
              </template>
              <template v-slot:item.total="{ item }">
                {{ item.total | dinheiro }}
              </template>
              <template v-slot:item.created_at="{ item }">
                {{ item.created_at | formatDate }}
              </template>
              <template v-slot:body.append="{  }">
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>Total</td>
                  <td colspan="2">
                    {{ total() }}
                  </td>
                </tr>
              </template>
              <template v-slot:expanded-item="{ headers, item }">
                <td :colspan="headers.length">
                  <v-row>
                    <v-col cols="12" md="8">
                      <v-card class="my-4">
                        <v-card-subtitle>Itens Vendidos</v-card-subtitle>
                        <v-card-text>
                          <v-data-table dense hide-default-footer :items-per-page="-1" :headers="headersVendaProduto" :items="item.vendaProduto" class="elevation-0">
                            <!-- <template v-slot:item.id="{ item }">
                              <v-btn icon @click.stop="editar(item)"><v-icon color="yellow darken-2">mdi-pencil</v-icon></v-btn>
                              <v-btn icon @click.stop="excluir(item)"><v-icon color="red darken-2">mdi-trash-can</v-icon></v-btn> {{ items.indexOf(item) +1 }}
                            </template> -->
                            <template v-slot:item.nome="{ item }">
                              {{ item.produto.nome }}
                            </template>
                            <template v-slot:item.codigo="{ item }">
                              {{ item.produto.codigo }}
                            </template>
                            <template v-slot:item.marca="{ item }">
                              {{ item.produto.marca.nome }}
                            </template>
                            <template v-slot:item.categoria="{ item }">
                              {{ item.produto.categoria.nome }}
                            </template>
                            <template v-slot:item.preco="{ item }">
                              {{ item.preco | dinheiro }}
                            </template>
                            <template v-slot:item.total="{ item }">
                              {{ item.quantidade * item.preco | dinheiro }}
                            </template>
                          </v-data-table>
                        </v-card-text>
                      </v-card>
                    </v-col>
                    <v-col cols="12" md="4">
                      <v-card class="my-4">
                        <v-card-subtitle>Pagamento</v-card-subtitle>
                        <v-card-text>
                          <v-row v-for="(pg,index) in item.pagamento" :key="index">
                            <v-col cols="12" md="3">
                              <v-chip :color="tipoPagamentoColor(pg.tipoPagamento.id)" text-color="white">
                                <v-avatar left>
                                  <v-icon>{{ tipoPagamentoIcon(pg.tipoPagamento.id) }}</v-icon>
                                </v-avatar>
                                {{ pg.tipoPagamento.descricao }}
                              </v-chip>
                            </v-col>
                            <v-col cols="12" md="2">
                              <v-text-field dense label="Valor" disabled :value="pg.valor | dinheiro"></v-text-field>
                            </v-col>
                            <v-col cols="12" md="3">
                              <v-text-field dense label="parcelas" disabled :value="pg.parcelas" v-if="'parcelas' in pg && pg.parcelas != null"></v-text-field>
                            </v-col>
                          </v-row>
                          <v-row class="justify-end">
                            <v-col cols="12" md="12">
                              <v-card-subtitle>Outros</v-card-subtitle>
                              <v-divider></v-divider>
                              <v-row>
                                <v-spacer></v-spacer>
                                <v-col cols="12" md="3" class="my-2">
                                  <v-text-field label="Desconto" disabled :value="item.desconto | dinheiro"></v-text-field>
                                </v-col>
                              </v-row>
                              <v-row>
                                <v-col cols="12" md="12">
                                  {{ item.observacao }}
                                </v-col>
                              </v-row>
                            </v-col>
                          </v-row>                    
                          
                          <v-row class="justify-end">
                            <v-col cols="12" md="3">
                              <v-list-item two-line>
                                <v-list-item-content>
                                  <v-list-item-title class="text-right"><span class="body-1 font-weight-black blue--text text--darken-3">{{ item.quantidade }}</span></v-list-item-title>
                                  <v-list-item-subtitle class="text-right">Itens</v-list-item-subtitle>
                                </v-list-item-content>
                              </v-list-item>
                            </v-col>
                            <v-col cols="12" md="4">
                              <v-list-item two-line>
                                <v-list-item-content>
                                  <v-list-item-title class="text-right"><span class="body-1 font-weight-black blue--text text--darken-3">R$ {{ item.total | dinheiro}}</span></v-list-item-title>
                                  <v-list-item-subtitle class="text-right">Total da Venda</v-list-item-subtitle>
                                </v-list-item-content>
                              </v-list-item>
                            </v-col>
                            <!-- <v-col cols="12" md="5">
                              <v-list-item two-line>
                                <v-list-item-content>
                                  <v-list-item-title class="text-right"><span class="body-1 font-weight-black blue--text text--darken-3">R$ {{ totalPagamentos | dinheiro }}</span></v-list-item-title>
                                  <v-list-item-subtitle class="text-right">Total Pagamentos</v-list-item-subtitle>
                                </v-list-item-content>
                              </v-list-item>
                            </v-col> -->
                          </v-row>
                        </v-card-text>
                      </v-card>
                    </v-col>
                  </v-row>
                </td>
              </template>
            </v-data-table>
          </v-card-text>
        </v-card>
      </v-col>
      <v-col cols="12" md="2">
        <v-card>
          <v-card-title>Pesquisar</v-card-title>
          <v-card-text>
            <v-menu ref="menu1" v-model="menu1" :close-on-content-click="false" transition="scale-transition" offset-y max-width="290px" min-width="auto">
              <template v-slot:activator="{ on, attrs }">
                <v-text-field v-model="inicio_formatado" label="Inicio" hint="Data inicial" persistent-hint show-current prepend-icon="mdi-calendar" locale="pt-br" v-bind="attrs" v-on="on" ></v-text-field>
              </template>
              <v-date-picker v-model="form.inicio" :allowed-dates="allowedDatesInicio" no-title @input="menu1 = false" ></v-date-picker>
            </v-menu>
            <v-menu ref="menu1" v-model="menu2" :close-on-content-click="false" transition="scale-transition" offset-y max-width="290px" min-width="auto">
              <template v-slot:activator="{ on, attrs }">
                <v-text-field v-model="fim_formatado" label="Fim" hint="Data final" persistent-hint prepend-icon="mdi-calendar" v-bind="attrs" v-on="on" ></v-text-field>
              </template>
              <v-date-picker v-model="form.fim" :allowed-dates="allowedDates" no-title @input="menu2 = false" ></v-date-picker>
            </v-menu>
            <v-row>
              <v-col cols="12" md="12">
                <v-btn outlined small color="green darken-2" @click="ontem" class="mt-8 mx-2 my-2">Último dia</v-btn>
                <v-btn outlined small color="blue darken-2" @click="ultimosSeteDias" class="mx-2 my-2">Últimos sete dias</v-btn>
                <v-btn outlined small color="purple darken-2" @click="ultimoMes" class="mx-2 my-2">Último mês</v-btn>
                <v-btn outlined small color="accent darken-2" @click="ultimoSeisMeses" class="mx-2 my-2">Último seis meses</v-btn>
                <v-btn outlined small color="primary darken-2" @click="ultimoDozeMeses" class="mx-2 my-2">Último doze meses</v-btn>
              </v-col>
            </v-row>
          </v-card-text>
          <v-card-actions>
            <v-btn color="primary" @click="pesquisar">Pesquisar</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import VendaService from "../services/VendaService.js"
import {VMoney} from 'v-money'
import moment from 'moment'

export default {
  name: "RelatorioVenda",
  data: () => ({
    menu1: false,
    menu2: false,
    loading: false,
    expanded: [],
    options: {},
    totalItems: 0,
    form: {
      inicio: '',
      fim: '',
    },
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
    items: [],
    headers: [
      {
        text: 'Id',
        value: 'id',
        sortable: true,
        // hidden: true
      },
      {
        text: 'Data',
        value: 'created_at',
        align: 'left',
        sortable: true
      },
      {
        text: 'Observação',
        value: 'observacao',
        align: 'left',
        sortable: true
      },
      {
        text: 'Desconto',
        value: 'desconto',
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
    headersVendaProduto: [
      // {
      //   text: '',
      //   value: 'id',
      //   sortable: true,
      //   hide: true
      // },
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
  }),
  watch: {
    options () {
      this.pesquisar()
    }
  },
  created() {
    // this.pesquisar()
    // this.listarCategoria()
    // this.listarMarca()
  },
  computed: {
    inicio_formatado () {
        return (this.form.inicio) ? moment(String(this.form.inicio)).format('DD/MM/YYYY') : ''
    },
    fim_formatado () {
        return (this.form.fim) ? moment(String(this.form.fim)).format('DD/MM/YYYY') : ''
    }
  },
  methods: {
    total () {
      let t = 0;
      this.items.forEach((item) => {
        t += item.total
      })
      
      return parseFloat(t).toLocaleString('pt-br', {minimumFractionDigits: 2});
    },
    allowedDatesInicio(val) {
      return (this.form.fim) ? moment(val).isBefore(this.form.fim) : true
    },
    allowedDates(val) {
      return (this.form.inicio) ? moment(val).isAfter(this.form.inicio) : true
    },
    tipoPagamentoColor(id) {
      return this.tiposPagamentosButtons[id -1].color
    },
    tipoPagamentoIcon(id) {
      return this.tiposPagamentosButtons[id -1].icon
    },
    pesquisar() {
      this.loading = true
      let vendaService = new VendaService()
      vendaService.pesquisar(this.options, this.form).then(res => {
        this.totalItems = res.data.meta.total
        this.items = res.data.data
        this.loading = false
      })
    },
    ontem(){
      this.form.inicio = moment().subtract(1, 'days').format('YYYY-MM-DD')
      this.form.fim = moment().format('YYYY-MM-DD')
      this.pesquisar()
    },
    ultimosSeteDias(){
      this.form.inicio = moment().subtract(7, 'days').format('YYYY-MM-DD')
      this.form.fim = moment().format('YYYY-MM-DD')
      this.pesquisar()
    },
    ultimoMes() {
      this.form.inicio = moment().subtract(30, 'days').format('YYYY-MM-DD')
      this.form.fim = moment().format('YYYY-MM-DD')
      this.pesquisar()
    },
    ultimoSeisMeses() {
      this.form.inicio = moment().subtract(6, 'months').format('YYYY-MM-DD')
      this.form.fim = moment().format('YYYY-MM-DD')
      this.pesquisar()
    },
    ultimoDozeMeses() {
      this.form.inicio = moment().subtract(12, 'months').format('YYYY-MM-DD')
      this.form.fim = moment().format('YYYY-MM-DD')
      this.pesquisar()
    },
  },
  filters: {
    dinheiro (value) {
      if (!value) return ''
      return parseFloat(value).toLocaleString('pt-br', {minimumFractionDigits: 2});
    },
    formatDate (value) {
      if (value) {
        return moment(String(value)).format('DD/MM/YYYY hh:mm:ss')
      }
    }
  },
  directives: {money: VMoney}
};
</script>

