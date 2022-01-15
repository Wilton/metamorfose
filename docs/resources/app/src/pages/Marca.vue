<template>
  <v-container fluid class="elements-page mt-3">
    <v-card>
      <!-- <v-toolbar tabs flat>
        <v-btn flat @click.stop="openDialog()" >Nova Marca</v-btn>
      </v-toolbar> -->
      <v-card-title>Marca</v-card-title>
      <v-card-text>
        <v-btn fab absolute right bottom color="primary" primary @click.stop="openDialog()" ><v-icon>mdi-plus</v-icon></v-btn>
        <v-data-table :server-items-length="footerProps.totalItems" :footer-props="footerProps" :items-per-page="15" :headers="headers" :items="items" class="elevation-1">
          <template v-slot:item.ativo="{ item }">
            {{ item.ativo == 1 ? 'Sim' : 'Não' }}
          </template>
          <template v-slot:item.id="{ item }">
            <v-btn icon @click.stop="openDialogEdit(item)"><v-icon color="yellow darken-2">mdi-pencil</v-icon></v-btn>
          </template>
        </v-data-table>

      </v-card-text>
    </v-card>
    <v-dialog transition="dialog-top-transition" max-width="600" v-model="dialog" ref="dialog-insert">
      <template v-slot:default="dialog">
        <v-card>
          <v-toolbar color="primary" dark>Adicionando nova Marca</v-toolbar>
          <v-card-text>
            <v-form>
              <v-row>
                <v-col cols="12" md="12">
                  <v-checkbox v-model="form.ativo" label="Ativo"></v-checkbox>
                  <v-text-field  v-model="form.nome" label="Nome"></v-text-field>
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
    <v-dialog transition="dialog-top-transition" max-width="600" v-model="dialogEdit" ref="dialog-edit">
      <v-card>
        <v-toolbar color="primary" dark>Editando Marca</v-toolbar>
        <v-card-text>
          <v-form>
            <v-row>
              <v-col cols="12" md="12">
                  <v-checkbox v-model="formEdit.ativo" label="Ativo"></v-checkbox>
                  <v-text-field  v-model="formEdit.nome" label="Nome"></v-text-field>
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
import MarcaService from "../services/MarcaService"

export default {
  name: "Marca",
  data: () => ({
    dialog: false,
    dialogEdit: false,
    footerProps: {
      'items-per-page-options': [15, 30, 50, 100],
      'items-per-page': 15,
      totalItems: 0,
      page: 0
    },
    form: {
      ativo: '',
      nome: '',
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
        // hidden: true
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
  created() {
    this.pesquisar()
  },
  methods: {
    pesquisar() {
      this.loading = true
      let marcaService = new MarcaService()
      marcaService.paginate().then(res => {
        let dados = res.data.data
        this.items = dados
        this.footerProps.totalItems = res.data.data.total
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
        this.$emit('notify', {tipo: "success", text: 'Atualização realizada com sucesso'})
        this.pesquisar()
        this.dialogEdit = false
      })
    },
    cadastrar() {
      let marcaService = new MarcaService()
      marcaService.create(this.form).then(res => {
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
      this.dialogEdit = true
    }
  },
};
</script>

