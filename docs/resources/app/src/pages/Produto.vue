<template>
  <v-container fluid class="elements-page mt-3">
    <v-card>
      <v-card-title>Produto</v-card-title>
      <v-card-text>
        <v-btn fab absolute right bottom color="primary" primary @click.stop="openDialog()" ><v-icon>mdi-plus</v-icon></v-btn>
        <v-data-table :server-items-length="footerProps.totalItems" :footer-props="footerProps" :items-per-page="15" :headers="headers" :items="items" class="elevation-1">
          <template v-slot:item.ativo="{ item }">
            {{ item.ativo == 1 ? 'Sim' : 'Não' }}
          </template>
          <template v-slot:item.marca="{ item }">
            {{ item.marca.nome}}
          </template>
          <template v-slot:item.categoria="{ item }">
            {{ item.categoria.nome }}
          </template>

          <template v-slot:item.id="{ item }">
            <v-btn icon @click.stop="openDialogEdit(item)"><v-icon color="yellow darken-2">mdi-pencil</v-icon></v-btn>
          </template>
        </v-data-table>
      </v-card-text>
    </v-card>
    <v-dialog transition="dialog-top-transition" max-width="1000" v-model="dialog" ref="dialog-insert">
      <template v-slot:default="dialog">
        <v-card>
          <v-toolbar color="primary" dark>Adicionando novo Produto</v-toolbar>
          <v-card-text>
            <v-form>
              <v-row>
                <v-col cols="12" md="12">
                  <v-checkbox v-model="form.ativo" label="Ativo"></v-checkbox>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="12" md="4">
                  <v-text-field  v-model="form.codigo" label="Codigo"></v-text-field>
                </v-col>
                <v-col cols="12" md="8">
                  <v-text-field  v-model="form.nome" label="Nome"></v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="12" md="12">
                  <v-textarea v-model="form.descricao" label="Descrição"></v-textarea>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="12" md="4">
                  <v-combobox v-model="form.marca" :items="marcas" item-text="nome" item-value="id" label="Marca"></v-combobox>
                </v-col>
                <v-col cols="12" md="4">
                  <v-combobox v-model="form.categoria" :items="categorias" item-text="nome" item-value="id" label="Categoria"></v-combobox>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field  v-model="form.quantidade" label="Quantidade"></v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="12" md="4">
                  <v-text-field  v-model="form.custo"  v-mask="mask"  label="Custo"></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field  v-model="form.preco"  v-mask="mask"  label="Preço"></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field  v-model="form.quantidade_alerta" label="Quantidade Alerta"></v-text-field>
                </v-col>
              </v-row>
            </v-form>
          </v-card-text>
          <v-card-actions class="justify-around">
            <v-btn color="primary" @click="cadastrar()">Salvar</v-btn>
            <v-spacer></v-spacer>
            <v-btn text @click="dialog=false">Fechar</v-btn>
          </v-card-actions>
        </v-card>
      </template>
    </v-dialog>
    <v-dialog transition="dialog-top-transition" max-width="1000" v-model="dialogEdit" ref="dialog-edit">
      <v-card>
        <v-toolbar color="primary" dark>Editando Produto</v-toolbar>
        <v-card-text>
          <v-form>
            <v-row>
              <v-col cols="12" md="12">
                <v-checkbox v-model="formEdit.ativo" label="Ativo"></v-checkbox>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" md="4">
                <v-text-field  v-model="formEdit.codigo" label="Codigo"></v-text-field>
              </v-col>
              <v-col cols="12" md="8">
                <v-text-field  v-model="formEdit.nome" label="Nome"></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" md="12">
                <v-textarea v-model="formEdit.descricao" label="Descrição"></v-textarea>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" md="4">
                <v-combobox v-model="formEdit.marca" :items="marcas" item-text="nome" item-value="id" label="Marca"></v-combobox>
              </v-col>
              <v-col cols="12" md="4">
                <v-combobox v-model="formEdit.categoria" :items="categorias" item-text="nome" item-value="id" label="Categoria"></v-combobox>
              </v-col>
              <v-col cols="12" md="4">
                <v-text-field  v-model="formEdit.quantidade" label="Quantidade"></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" md="4">
                <v-text-field  v-model="formEdit.custo" label="Custo"></v-text-field>
              </v-col>
              <v-col cols="12" md="4">
                <v-text-field  v-model="formEdit.preco" label="Preço"></v-text-field>
              </v-col>
              <v-col cols="12" md="4">
                <v-text-field  v-model="formEdit.quantidade_alerta" label="Quantidade Alerta"></v-text-field>
              </v-col>
            </v-row>
          </v-form>
        </v-card-text>
        <v-card-actions class="justify-around">
          <v-btn color="primary" @click="atualizar()">Salvar</v-btn>
          <v-spacer></v-spacer>
          <v-btn text @click="dialogEdit = false">Fechar</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

  </v-container>
</template>

<script>
import { limparForm } from "../utils/limparForm"
import createNumberMask from 'text-mask-addons/dist/createNumberMask';
import ProdutoService from "../services/ProdutoService"
import CategoriaService from '../services/CategoriaService';
import MarcaService from '../services/MarcaService';

const currencyMask = createNumberMask({
  prefix: '',
  allowDecimal: true,
  includeThousandsSeparator: true,
  thousandsSeparatorSymbol: '.',
  decimalSymbol: ',',
  allowNegative: false,
  allowLeadingZeroes: true,
  integerLimit: 5
});

export default {
  name: "Produto",
  data: () => ({
    mask: currencyMask,
    dialog: false,
    dialogEdit: false,
    footerProps: {
      'items-per-page-options': [15, 30, 50, 100],
      'items-per-page': 15,
      totalItems: 0,
      page: 0
    },
    items: [],
    form: {
      ativo: '',
      nome: '',
      codigo: '',
      descricao: '',
      marca_id: '',
      categoria_id: '',
      custo: '',
      preco: '',
      quantidade: '',
      quantidade_alerta: ''
    },
    formEdit: {
      ativo: '',
      nome: '',
      codigo: '',
      descricao: '',
      marca_id: '',
      categoria_id: '',
      custo: '',
      preco: '',
      quantidade: '',
      quantidade_alerta: ''
    },
    marcas: [],
    categorias: [],
    menu_from: false,
    menu_to: false,
    modal: false,
    headers: [
      {
        text: '',
        value: 'id',
        sortable: true,
        // hidden: true
      },
      {
        text: 'Nome',
        value: 'nome',
        align: 'left',
        sortable: true
      },
      {
        text: 'Código',
        value: 'codigo',
        align: 'left',
        sortable: true
      },
      {
        text: 'Descrição',
        value: 'descricao',
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
        text: 'Categoria',
        value: 'categoria',
        align: 'left',
        sortable: true
      },
      {
        text: 'Custo',
        value: 'custo',
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
        text: 'Alerta',
        value: 'quantidade_alerta',
        align: 'left',
        sortable: true
      },
      {
        text: 'Ativo',
        value: 'ativo',
        align: 'left',
        sortable: true
      }
    ],
  }),
  created() {
    console.clear()
    this.pesquisar()
    this.listarCategoria()
    this.listarMarca()
  },
  methods: {
    pesquisar() {
      console.log('pesquisando')
      this.loading = true
      let produtoService = new ProdutoService()
      produtoService.paginate().then(res => {
        let dados = res.data.data.data
        this.footerProps.totalItems = res.data.data.total
        this.items = dados
        this.loading = false
      })
    },
    listarCategoria() {
      this.loading = true
      let categoriaService = new CategoriaService()
      categoriaService.paginate().then(res => {
        let dados = res.data.data
        this.categorias = dados
        this.loading = false
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
    read(id) {
      let produtoService = new ProdutoService()
      produtoService.read(id).then(res => {
        this.formEdit = res.data.data
        this.loading = false
      })
    },
    atualizar() {
      let dados = this.formEdit
      dados.categoria_id = dados.categoria.id
      dados.marca_id = dados.marca.id
      delete dados.categoria, dados.marca, dados.update_at, dados.created_at

      let produtoService = new ProdutoService()
      produtoService.update(this.formEdit.id, dados).then(res => {
        console.log(res)
        this.$emit('notify', {tipo: "success", text: 'Atualização realizado com sucesso'})
        this.dialogEdit = false
        this.pesquisar()
      })
    },
    cadastrar() {
      let dados = this.form
      dados.categoria_id = dados.categoria.id
      dados.marca_id = dados.marca.id
      delete dados.marca, dados.categoria, dados.update_at, dados.created_at

      let produtoService = new ProdutoService()
      produtoService.create(dados).then(res => {
        console.log(res)
        this.$emit('notify', {tipo: "success", text: 'Cadastro realizado com sucesso'})
        this.pesquisar()
        this.dialog = false
      })
    },
    openDialog () {
      limparForm(this.form)
      this.dialog = true
    },
    openDialogEdit (item) {
      this.read(item.id)
      // this.formEdit = item
      this.dialogEdit = true
    }
  },
};</script>

