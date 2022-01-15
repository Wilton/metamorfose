<template>
  <v-container fluid class="elements-page mt-3">
    <v-row>
      <v-col cols="12" md="8">
        <v-card  style="height: calc(100vh - 173px);">
          <v-card-title>Venda / Orçamento</v-card-title>
          <v-card-text style="height: calc(100vh - 308px);">
            <v-data-table dense height="calc(100vh - 440px)" hide-default-footer :items-per-page="-1" :headers="headers" :items="items" class="elevation-1">
              <template v-slot:item.id="{ item }">
                <v-btn icon @click.stop="editar(item)"><v-icon color="yellow darken-2">mdi-pencil</v-icon></v-btn>
                <v-btn icon @click.stop="excluir(item)"><v-icon color="red darken-2">mdi-trash-can</v-icon></v-btn> {{ items.indexOf(item) +1 }}
              </template>
              <template v-slot:item.marca="{ item }">
                {{ item.marca.nome }}
              </template>
              <template v-slot:item.categoria="{ item }">
                {{ item.categoria.nome }}
              </template>
            </v-data-table>
            <v-divider></v-divider>
            <v-form>
              <v-row>
                <v-col cols="12" md="3">
                  <v-text-field  v-model="form.desconto" label="Desconto"></v-text-field>
                </v-col>
                <v-spacer></v-spacer>
                <v-col cols="12" md="2">
                  <v-list-item two-line>
                    <v-list-item-content>
                      <v-list-item-title class="text-right"><span class="display-1 font-weight-black blue--text text--darken-3">{{ items.length }}</span></v-list-item-title>
                      <v-list-item-subtitle class="text-right">Itens</v-list-item-subtitle>
                    </v-list-item-content>
                  </v-list-item>
                </v-col>
                <v-col cols="12" md="3">
                  <v-list-item two-line>
                    <v-list-item-content>
                      <v-list-item-title class="text-right"><span class="display-1 font-weight-black blue--text text--darken-3">R$ {{ total }}</span></v-list-item-title>
                      <v-list-item-subtitle class="text-right">Total</v-list-item-subtitle>
                    </v-list-item-content>
                  </v-list-item>
                </v-col>
              </v-row>
            </v-form>
          </v-card-text>
          <v-card-actions class="justify-around">
            <v-spacer></v-spacer>
            <v-btn color="green" @click="dialog=false">Salvar</v-btn>
          </v-card-actions>
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
          <v-tabs-items v-model="tab">
            <v-tab-item>
              <v-card :loading="loading" style="height: calc(100vh - 245px);">
                <v-card-title>Adicionando Produtos</v-card-title>
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
                    <v-card-subtitle v-if="produtoSelecionado">Produto encontrado</v-card-subtitle>
                    <v-row v-if="produtoSelecionado">
                      <v-col cols="12" md="12">
                        <v-list-item three-line>
                          <v-list-item-content>
                            <v-list-item-title>{{ form.nome }} / {{ form.marca.nome }}</v-list-item-title>
                            <v-list-item-subtitle>
                              {{ form.descricao }}
                            </v-list-item-subtitle>
                            <v-list-item-subtitle>
                              Preço: {{ form.preco }} / Categoria: {{ form.categoria.nome }}
                            </v-list-item-subtitle>
                          </v-list-item-content>
                        </v-list-item>
                      </v-col>
                    </v-row>
                    <v-card-subtitle v-if="produtoSelecionado">Quantidade / Preço / Total Parcial</v-card-subtitle>
                    <v-row v-if="produtoSelecionado">
                      <v-col cols="12" md="3">
                        <v-text-field v-model="form.quantidade_produto" @blur="calcularTotalParcial()" label="Quantidade"></v-text-field>
                      </v-col>
                      <v-col cols="12" md="4">
                        <v-text-field readonly v-model="form.preco" v-mask="mask" label="Preço"></v-text-field>
                      </v-col>
                      <v-col cols="12" md="5">
                        <v-text-field v-model="form.total_parcial" label="Total Parcial"></v-text-field>
                      </v-col>
                    </v-row>
                  </v-form>
                </v-card-text>
                <v-card-actions class="justify-around ">
                  <v-tooltip bottom>
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn x-large class="white--text" color="indigo" @click="addProduto()" v-bind="attrs" v-on="on">
                        <v-icon color="white">
                          mdi-plus
                        </v-icon>
                        Adicionar Produto
                      </v-btn>
                    </template>
                    <span>Adicionar Produto</span>
                  </v-tooltip>
                </v-card-actions>
              </v-card>           
            </v-tab-item>
            <v-tab-item>
              <v-card :loading="loading" style="height: calc(100vh - 245px);">
                <v-card-title>Pesquisar</v-card-title>
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
                              <td>{{ item.preco }}</td>
                            </tr>
                          </tbody>
                        </template>
                      </v-simple-table>
                    </v-row>
                  </v-form>
                </v-card-text>
                <v-card-actions class="justify-around">
                  <!-- <v-btn color="primary" @click="addProduto()">Adicionar Produto</v-btn> -->
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
import { limparForm } from "../utils/limparForm"
import createNumberMask from 'text-mask-addons/dist/createNumberMask';
import ProdutoService from "../services/ProdutoService"
// import CategoriaService from '../services/CategoriaService';
import MarcaService from '../services/MarcaService';


const currencyMask = createNumberMask({
  prefix: '',
  allowDecimal: true,
  includeThousandsSeparator: true,
  decimalSymbol: '.',
  allowNegative: false,
  allowLeadingZeroes: true,
  integerLimit: 5
});

export default {
  name: "Venda",
  data: () => ({
    mask: currencyMask,
    dialog: false,
    dialogEdit: false,
    loading: false,
    loadingCodigo: false,
    tab: null,
    menu_from: false,
    menu_to: false,
    modal: false,
    produtoSelecionado: false,
    pagination: {
      rowsPerPage: 1500,
      totalItems: 0,
      page: 0
    },
    pesquisa: {
      codigo: '',
      nome: '',
      marca: ''
    },
    form: {
      nome: '',
      codigo: '',
      descricao: '',
      marca: '',
      categoria: '',
      custo: '',
      preco: '',
      quantidade: '',
      quantidade_alerta: '',
      quantidade_produto: '1',
      total_parcial: ''
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
    items: [
      { codigo: '0001', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 1},
      { codigo: '0002', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 2},
      { codigo: '0003', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 3},
      { codigo: '0004', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 4},
      { codigo: '0005', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 5},
      { codigo: '0006', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 6},
      { codigo: '0007', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 7},
      { codigo: '0008', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 8},
      { codigo: '0009', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 9},
      { codigo: '0010', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 10},
      { codigo: '0011', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 11},
      { codigo: '0012', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 12},
      { codigo: '0013', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 13},
      { codigo: '0014', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 14},
      { codigo: '0015', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 15},
      { codigo: '0016', nome: "Lapiseira 0.7mm", descricao: 'Lapiseira 0.7mm', marca: 'Pentel', total: '150.00', preco: '1.50', quantidade: '100', id: 16},
    ],
    itemsPesquisa: []
  }),
  created() {
    this.listarMarca()
  },
  methods: {
    pesquisarProduto() {
      this.loading = true
      let produtoService = new ProdutoService()
      // let codigo = this.pesquisa.codigo
      produtoService.pesquisar(this.pesquisa).then(res => {
        this.itemsPesquisa = res.data.data
        this.loading = false
      })
    },
    pesquisarProdutoPorCodigo() {
      this.loadingCodigo = true
      let produtoService = new ProdutoService()
      // let codigo = this.pesquisa.codigo
      produtoService.pesquisar({"codigo": this.pesquisa.codigo}).then(res => {
        this.form = res.data.data[0]
        this.form.quantidade_produto = 1
        this.form.total_parcial = this.form.quantidade_produto * this.form.preco
        // this.calcularTotalParcial()
        this.produtoSelecionado = true
        this.loadingCodigo = false
      })
    },
    listarMarca() {
      this.loading = true
      let marcaService = new MarcaService()
      marcaService.paginate().then(res => {
        let dados = res.data.data
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
      limparForm(this.pesquisa)
      // for (let i = 0; i < this.form.quantidade_produto; i++) {
      // }

    },
    addProdutoPesquisado (item) {
      this.form = item
      this.form.quantidade_produto = 1
      this.form.total_parcial = this.form.quantidade_produto * this.form.preco
      this.produtoSelecionado = true
      // this.calcularTotalParcial()

      // let o = JSON.parse(JSON.stringify(item))
      // o.id = this.items.length +1
      // this.items = [o].concat(this.items)
    },
    // calcularTotalParcial() {
    //   this.form.total_parcial = parseFloat(this.form.preco * this.form.quantidade_produto)
    //   console.log('recebendo o evento blur')
    //   console.log(this.form.preco)
    //   console.log(this.form.quantidade_produto)
    //   console.log(this.form.total_parcial)
    // },
    editar(item) {
      this.form = item
    },
    excluir(index) {
      alert(index)
    }
    
  },
  watch: {
    quantidade_produto: function (val) {
      this.form.total_parcial = parseFloat(this.form.preco * val)
    }
  },
  computed: {
    // a computed getter
    total: function () {
      var t = 0;
      this.items.forEach((item) => {
        t += (item.quantidade * item.preco)
      })
      // `this` points to the vm instance
      return t
    }

  }
};
</script>

