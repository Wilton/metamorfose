<template>
  <v-app>
    <v-app-bar app color="primary" dark height="64" fixed>
    <v-toolbar-title :class="$vuetify.theme.dark ? 'primary--text' : null" class="mx-2">
      <v-img max-width="100" src="@/assets/img/logo.png"></v-img>
    </v-toolbar-title> 
    <v-tooltip bottom>
      <template v-slot:activator="{ on, attrs }">
        <v-btn icon class="mx-2" v-bind="attrs" v-on="on" to="/">
          <v-icon size="28">mdi-home-outline</v-icon>
        </v-btn>
      </template>
      <span>Home</span>
    </v-tooltip>
    <!-- <v-btn plain class="mr-2" to="/dashboard">Dashboard</v-btn> -->
    <!-- <v-btn plain v-bind="attrs" v-on="on" class="mr-2" to="/extra/calendar" >Calendar</v-btn> -->
    <v-btn plain class="mr-2" to="/venda">Vender</v-btn>
    <v-menu offset-y bottom nudge-bottom="10" right>
      <template v-slot:activator="{ on, attrs }">
        <v-btn plain v-bind="attrs" v-on="on" class="mr-2">
          Cadastros
        </v-btn>
      </template>
      <v-list>
        <v-list-item-group color="primary">
          <v-list-item to="/produto">
            <v-list-item-content>Produto</v-list-item-content>
          </v-list-item>
          <v-list-item to="/categoria">
            <v-list-item-content>Categoria</v-list-item-content>
          </v-list-item>
          <v-list-item to="/marca">
            <v-list-item-content>Marca</v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-menu>
    <v-btn plain class="mr-2" to="/relatorio-vendas">Relatório de Vendas</v-btn>
    <v-spacer></v-spacer>
    <v-badge bordered overlap color="error" :content="this.alertas.length" v-if="this.alertas.length" class="mr-16">
      <v-btn icon to="/"><v-icon>mdi-bell-outline</v-icon></v-btn>
    </v-badge>

    </v-app-bar>
    <v-snackbar v-model="nty.snackbar" top right multi-line vertical :timeout="nty.timeout" :color="nty.color" elevation="24">
      {{ nty.text }}
      <template v-slot:action="{ attrs }">
        <v-btn dark text icon v-bind="attrs" @click="nty.snackbar = false">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </template>
    </v-snackbar>
    <v-main>
      <router-view @notify="openSnackbar">
      </router-view>
    </v-main>
  </v-app>
</template>

<script>
import ProdutoService from "./services/ProdutoService"


export default {
  name: 'App',

  data: () => ({
    alertas: [],
    nty: {
      snackbar: false,
      y: 'top',
      x: null,
      color: 'success',
      mode: '',
      timeout: 6000,
      text: 'wilton barbosa da silva júniro',
    },
    ajax: {
      indeterminate: false,
      value: 100,
      color: 'info',
      loading: true,
    }
    //
  }),
  created() {
    this.alertaProduto()
  },
  methods: {
    alertaProduto() {
      let produtoService = new ProdutoService()
      produtoService.alerta().then((res) => {
        this.alertas = res.data.data
      })
    },
    openSnackbar(event){
      // console.log('openSnackbar')
      // console.log(event)
      let cores = {
        info:    'info',
        success: 'success',
        error:   'error',
        warning: 'warning',
        notice:  'warning'
      }
      this.nty.text = event.text
      this.nty.color = cores[event.type]
      this.nty.snackbar = true
    },
  }
};
</script>
