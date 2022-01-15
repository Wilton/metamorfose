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
                <v-text-field  v-model="formPesquisa.nome" clearable label="Nome"></v-text-field>
              </v-col>
            </v-row>
          </v-form>
        </v-card-text>
        <v-card-actions class="justify-around">
          <v-btn color="primary" @click="pesquisar()">Pesquisar</v-btn>
        </v-card-actions>
      </v-card>
    </v-navigation-drawer>
    <v-row>
      <v-col cols="12" md="12">
        <v-card>
          <v-card-title>
            Marca
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
              <template v-slot:item.id="{ item }">
                <v-btn icon @click.stop="openDialogEdit(item)"><v-icon color="yellow darken-2">mdi-pencil</v-icon></v-btn>
              </template>
            </v-data-table>

          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-dialog transition="dialog-top-transition" max-width="600" v-model="dialog" ref="dialog-insert">
      <template v-slot:default="dialog">
        <v-card>
          <v-toolbar color="primary" dark>Adicionando nova Marca</v-toolbar>
          <v-card-text>
            <v-form>
              <v-row>
                <v-col cols="12" md="12">
                  <v-checkbox v-model="form.ativo" :error="errors.ativo.length > 0" :error-messages="errors.ativo" label="Ativo"></v-checkbox>
                  <v-text-field  v-model="form.nome" ref="form_nome" :error="errors.nome.length > 0" :error-messages="errors.nome" label="Nome"></v-text-field>
                </v-col>
              </v-row>
            </v-form>
          </v-card-text>
          <v-card-actions class="justify-around">
            <v-btn color="primary" @click="cadastrar()">Salvar</v-btn>
            <v-spacer></v-spacer>
            <v-btn text @click="dialog = false">Fechar</v-btn>
          </v-card-actions>
        </v-card>
      </template>
    </v-dialog>
    <v-dialog transition="dialog-top-transition" max-width="600" v-model="dialogEdit" ref="dialog-edit">
      <v-card>
        <v-toolbar color="primary" dark>Editando Marca</v-toolbar>
        <v-card-text>
          <v-form>
            <v-row>
              <v-col cols="12" md="12">
                  <v-checkbox v-model="formEdit.ativo" label="Ativo" :error="errors.ativo.length > 0" :error-messages="errors.ativo"></v-checkbox>
                  <v-text-field  v-model="formEdit.nome" label="Nome" ref="form_edit_nome" :error="errors.nome.length > 0" :error-messages="errors.nome"></v-text-field>
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
import MarcaService from "../services/MarcaService.js"
import formMixin from "./../mixins/formMixin.js"
import { messages } from "./../utils/messages"

export default {
  mixins: [formMixin],
  name: "Marca",
  data: () => ({
    drawer: false,
    loading: false,
    dialog: false,
    dialogEdit: false,
    options: {},
    totalItems: 0,
    formPesquisa: {
      ativo: true,
      nome: '',
    },
    form: {
      ativo: '',
      nome: '',
    },
    errors: {
      ativo: [],
      nome: [],
    },
    formEdit: {
      ativo: '',
      nome: '',
    },    
    menu_from: false,
    menu_to: false,
    modal: false,
    headers: [
      {
        text: '',
        value: 'id',
        sortable: true,
      },
      {
        text: 'Nome',
        value: 'nome',
        align: 'left',
        sortable: true
      },
      {
        text: 'Ativo?',
        value: 'ativo',
        align: 'left',
        sortable: true
      }
    ],
    items: [],
  }),
  watch: {
    options () {
      this.pesquisar()
    }
  },
  created() {
  },
  methods: {
    pesquisar() {
      this.loading = true
      let marcaService = new MarcaService()
      marcaService.pesquisar(this.options, this.formPesquisa).then(res => {
        this.items = res.data.data
        this.totalItems = res.data.meta.total
        this.loading = false
      })
    },
    read(id) {
      let marcaService = new MarcaService()
      marcaService.read(id).then(res => {
        this.formEdit = res.data.data
        this.loading = false
      })
    },
    atualizar() {
      let marcaService = new MarcaService()
      marcaService.update(this.formEdit.id, this.formEdit).then(res => {
        console.log(res)
        this.success(messages.ATUALIZACAO_SUCESSO)
        this.pesquisar()
        this.dialogEdit = false
      })
    },
    cadastrar() {
      let marcaService = new MarcaService()
      marcaService.create(this.form).then(res => {
        console.log(res)
        this.success(messages.CADASTRO_SUCESSO)
        this.pesquisar()
        this.dialog = false
      })
    },
    openDialog () {
      this.clearForm(this.form, this.errors)
      this.dialog = true
      this.form.ativo = true
      setTimeout(() => {
        this.$refs.form_nome.focus()
      }, 250)
    },
    openDialogEdit (item) {
      this.clearForm(this.formEdit, this.errors)
      this.read(item.id)
      this.dialogEdit = true
    }
  },
};
</script>

