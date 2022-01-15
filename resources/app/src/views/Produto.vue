<template>
  <v-container fluid class="elements-page mt-3">
    <v-navigation-drawer v-model="drawer" absolute right temporary>
      <v-card class="elevation-0">
        <v-card-text>
          <v-list nav dense>
          <v-list-item link>
            <v-list-item-icon>
              <v-icon>mdi-filter-plus-outline</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Pesquisar</v-list-item-title>
          </v-list-item>
        </v-list>
          <v-form>
            <v-row>
              <v-col cols="12" md="12">
                <v-checkbox v-model="formPesquisa.ativo" label="Ativo"></v-checkbox>
                <v-text-field  v-model="formPesquisa.codigo" clearable label="Código"></v-text-field>
                <v-text-field  v-model="formPesquisa.nome" clearable label="Nome"></v-text-field>
                <v-text-field  v-model="formPesquisa.descricao" clearable label="Descricao"></v-text-field>
                <v-combobox v-model="formPesquisa.marca" :items="marcas" item-text="nome" item-value="id" :key="formPesquisa.marca" clearable label="Marca"></v-combobox>
                <v-combobox v-model="formPesquisa.categoria" :items="categorias" item-text="nome" item-value="id" clearable label="Categoria"></v-combobox>
              </v-col>
            </v-row>
          </v-form>
        </v-card-text>
        <v-card-actions class="justify-around">
          <v-btn color="primary" @click="pesquisar()">Pesquisar</v-btn>
        </v-card-actions>
      </v-card>
    </v-navigation-drawer>
    <v-card>
      <v-card-title>
        Produto
        <v-spacer></v-spacer>
        <v-btn color="blue darken-2" icon dark @click="drawer = !drawer">
          <v-icon>mdi-filter-outline</v-icon>
        </v-btn>
      </v-card-title>
      <v-card-text>
        <v-btn fab absolute left bottom color="primary" primary @click.stop="openDialog()" ><v-icon>mdi-plus</v-icon></v-btn>
        <v-data-table :options.sync="options" :server-items-length="totalItems" :loading="loading" :items-per-page="15" height="700" :headers="headers" :items="items" class="elevation-0">
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
                  <v-checkbox v-model="form.ativo" label="Ativo" :error="errors.ativo.length > 0" :error-messages="errors.ativo"></v-checkbox>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="12" md="4">
                  <v-text-field  v-model="form.codigo" label="Codigo" ref="form_codigo" :error="errors.codigo.length > 0" :error-messages="errors.codigo"></v-text-field>
                </v-col>
                <v-col cols="12" md="8">
                  <v-text-field  v-model="form.nome" label="Nome" :error="errors.nome.length > 0" :error-messages="errors.nome"></v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="12" md="12">
                  <v-textarea v-model="form.descricao" :value="form.descricao" rows="5" label="Descrição" counter :error="errors.descricao.length > 0" :error-messages="errors.descricao"></v-textarea>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="12" md="4">
                  <v-combobox v-model="form.marca" :items="marcas" item-text="nome" item-value="id" label="Marca" :error="errors.nome.length > 0" :error-messages="errors.nome"></v-combobox>
                </v-col>
                <v-col cols="12" md="4">
                  <v-combobox v-model="form.categoria" :items="categorias" item-text="nome" item-value="id" label="Categoria" :error="errors.categoria_id.length > 0" :error-messages="errors.categoria_id"></v-combobox>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field  v-model="form.quantidade" label="Quantidade" :error="errors.quantidade.length > 0" :error-messages="errors.quantidade"></v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="12" md="4">
                  <v-text-field  v-model.lazy="form.custo" v-money="money" label="Custo" :error="errors.custo.length > 0" :error-messages="errors.custo"></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field  v-model.lazy="form.preco" v-money="money" label="Preço" :error="errors.preco.length > 0" :error-messages="errors.preco"></v-text-field>
                </v-col>
                <v-col cols="12" md="4">
                  <v-text-field  v-model="form.quantidade_alerta" label="Quantidade Alerta" :error="errors.alerta.length > 0" :error-messages="errors.alerta"></v-text-field>
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
                <v-checkbox v-model="formEdit.ativo" label="Ativo" :error="errors.ativo.length > 0" :error-messages="errors.ativo"></v-checkbox>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" md="4">
                <v-text-field  v-model="formEdit.codigo" label="Codigo" :error="errors.codigo.length > 0" :error-messages="errors.codigo"></v-text-field>
              </v-col>
              <v-col cols="12" md="8">
                <v-text-field  v-model="formEdit.nome" label="Nome" :error="errors.nome.length > 0" :error-messages="errors.nome"></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" md="12">
                <v-textarea v-model="formEdit.descricao" rows="5" :value="formEdit.descricao" label="Descrição" counter :error="errors.descricao.length > 0" :error-messages="errors.descricao"></v-textarea>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" md="4">
                <v-combobox v-model="formEdit.marca" :items="marcas" item-text="nome" item-value="id" label="Marca" :error="errors.marca_id.length > 0" :error-messages="errors.marca_id"></v-combobox>
              </v-col>
              <v-col cols="12" md="4">
                <v-combobox v-model="formEdit.categoria" :items="categorias" item-text="nome" item-value="id" label="Categoria" :error="errors.categoria_id.length > 0" :error-messages="errors.categoria_id"></v-combobox>
              </v-col>
              <v-col cols="12" md="4">
                <v-text-field  v-model="formEdit.quantidade" label="Quantidade" :error="errors.quantidade.length > 0" :error-messages="errors.quantidade"></v-text-field>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" md="4">
                <v-text-field  v-model.lazy="formEdit.custo" v-money="money" label="Custo" :error="errors.custo.length > 0" :error-messages="errors.custo"></v-text-field>
              </v-col>
              <v-col cols="12" md="4">
                <v-text-field  v-model.lazy="formEdit.preco" v-money="money" label="Preço" :error="errors.preco.length > 0" :error-messages="errors.preco"></v-text-field>
              </v-col>
              <v-col cols="12" md="4">
                <v-text-field  v-model="formEdit.quantidade_alerta" label="Quantidade Alerta" :error="errors.alerta.length > 0" :error-messages="errors.alerta"></v-text-field>
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
// import { limparForm } from "../utils/limparForm.js"
import { toFloat } from "../utils/toFloat.js"
import ProdutoService from "../services/ProdutoService.js"
import CategoriaService from '../services/CategoriaService.js';
import MarcaService from '../services/MarcaService.js';
import { VMoney } from 'v-money'
import formMixin from "./../mixins/formMixin"
import { messages } from "./../utils/messages"

export default {
  mixins: [formMixin],
  name: "Produto",
  data: () => ({
    money: {
      decimal: ',',
      thousands: '.',
      prefix: '',
      // suffix: ' #',
      precision: 2,
      masked: false /* doesn't work with directive */
    },
    // mask: currencyMask,
    drawer: false,
    loading: false,
    dialog: false,
    dialogEdit: false,
    options: {},
    totalItems: 0,
    formPesquisa: {
      ativo: true,
      nome: '',
      codigo: '',
      descricao: '',
      marca: '',
      categoria: ''
    },
    items: [],
    form: {
      ativo: '',
      nome: '',
      codigo: '',
      descricao: '',
      marca_id: '',
      categoria_id: '',
      marca: {},
      categoria: {},
      custo: '',
      preco: '',
      quantidade: '',
      quantidade_alerta: ''
    },
    errors: {
      ativo: [],
      nome: [],
      codigo: [],
      descricao: [],
      marca_id: [],
      categoria_id: [],
      custo: [],
      preco: [],
      quantidade: [],
      alerta: []
    },
    formEdit: {
      ativo: '',
      nome: '',
      codigo: '',
      descricao: '',
      marca_id: '',
      categoria_id: '',
      marca: '',
      categoria: '',
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
    this.listarCategoria()
    this.listarMarca()
  },
  watch: {
    options () {
      this.pesquisar()
    }
  },
  methods: {
    pesquisar() {
      this.loading = true
      let produtoService = new ProdutoService()

      let f = {
        "nome"         : this.formPesquisa.nome,
        "codigo"       : this.formPesquisa.codigo,
        "descricao"    : this.formPesquisa.descricao,
        "marca_id"     : (this.formPesquisa.marca) ? this.formPesquisa.marca.id: '',
        "categoria_id" : (this.formPesquisa.categoria) ? this.formPesquisa.categoria.id: '',
      }
      produtoService.pesquisar(this.options, f).then(res => {
        let dados = res.data.data
        this.items = dados
        this.totalItems = res.data.meta.total
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
        this.formEdit.quantidade_alerta = this.formEdit.alerta
        this.formEdit.preco = parseFloat(this.formEdit.preco).toLocaleString('pt-br', {minimumFractionDigits: 2});
        this.formEdit.custo = parseFloat(this.formEdit.custo).toLocaleString('pt-br', {minimumFractionDigits: 2});
        this.loading = false
      })
    },
    atualizar() {
      let dados = this.formEdit
      dados.categoria_id = dados.categoria ? dados.categoria.id : ''
      dados.marca_id = dados.marca ? dados.marca.id : ''
      dados.preco = toFloat(dados.preco).toFixed(2)
      dados.custo = toFloat(dados.custo).toFixed(2)
      delete dados.categoria, dados.marca, dados.update_at, dados.created_at

      let produtoService = new ProdutoService()
      produtoService.update(this.formEdit.id, dados).then(() => {
        this.success(messages.ATUALIZACAO_SUCESSO)
        // this.$emit('notify', {tipo: "success", text: 'Atualização realizado com sucesso'})
        this.dialogEdit = false
        this.pesquisar()
      })
    },
    cadastrar() {
      let dados = this.form
      dados.categoria_id = dados.categoria ? dados.categoria.id : ''
      dados.marca_id = dados.marca ? dados.marca.id : ''
      dados.preco = toFloat(dados.preco).toFixed(2)
      dados.custo = toFloat(dados.custo).toFixed(2)
      dados.alerta = dados.quantidade_alerta
      delete dados.marca, dados.categoria, dados.update_at, dados.created_at, dados.quantidade_alerta

      let produtoService = new ProdutoService()
      produtoService.create(dados).then(() => {
        this.success(messages.CADASTRO_SUCESSO)
        // this.$emit('notify', {tipo: "success", text: 'Cadastro realizado com sucesso'})
        this.pesquisar()
        this.dialog = false
      })
    },
    openDialog () {
      // limparForm(this.form, this.errors)
      this.clearForm(this.form, this.errors)
      this.dialog = true
      this.form.ativo = true
      setTimeout(() => {
        this.$refs.form_codigo.focus()
      }, 250)
    },
    openDialogEdit (item) {
      this.clearForm(this.formEdit, this.errors)
      this.read(item.id)
      this.dialogEdit = true
    }
  },
  directives: {money: VMoney}
};
</script>

