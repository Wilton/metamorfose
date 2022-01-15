<template>
  <v-app>
    <v-progress-linear absolute top :active="ajax.loading" :indeterminate="ajax.indeterminate" :color="ajax.color" :value="ajax.value" class="ajax-loading"></v-progress-linear>
    <Header />
    <v-snackbar v-model="nty.snackbar" top right multi-line vertical :timeout="nty.timeout" :color="nty.color">
      {{ nty.text }}
      <template v-slot:action="{ attrs }">
        <v-btn
          dark 
          text
          v-bind="attrs"
          @click="nty.snackbar = false"
        >
          fechar
        </v-btn>
      </template>
    </v-snackbar>
    <!-- <Sidebar /> -->
    <v-main class="content mx-0 mx-md-2">
      <Breadcrumbs />
      <router-view @notify="openSnackbar"></router-view>
      <Footer />
      <!-- <Helper /> -->
    </v-main>
  </v-app>
</template>

<script>
    import Header from '@/components/Header/Header';
    // import Sidebar from '@/components/Sidebar/Sidebar';
    import Footer from "@/components/Footer/Footer";
    import Breadcrumbs from "@/components/Breadcrumbs/Breadcrumbs";
    import { eventHub } from '../../utils/eventHub'

    // import Helper from "@/components/Helper/Helper";

    export default {
      name: 'Layout',
      components: { Footer, Header, Breadcrumbs },
      data: () => ({
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
      }),
      created() {
        eventHub.$on('before-request', this.ajaxStart)
        eventHub.$on('request-error', this.ajaxStop('warning'))
        eventHub.$on('after-response', this.ajaxStop)
        eventHub.$on('response-error', this.ajaxError)
        eventHub.$on('token_error', this.tokenError)
      },
      methods: {          
        openSnackbar(event){
          console.log('openSnackbar')
          console.log(event)
          let cores = {
            info: 'info',
            success: 'success',
            error: 'error',
            warning: 'warning',
            notice: 'warning'
          }
          this.nty.text = event.text
          this.nty.color = cores[event.tipo]
          this.nty.snackbar = true
        },
        ajaxStart(){
          this.ajax.indeterminate = true
          this.ajax.color = 'info'
          // console.log('ajaxStart')
        },
        ajaxStop(color = 'info'){
          this.ajax.indeterminate = false
          this.ajax.color = color
          // console.log('ajax-stop')
        },
        ajaxError(){
          this.ajax.indeterminate = false
          this.ajax.color = 'error'
          // console.log('ajax-error')
        },
        tokenError(){
          // verificar a necessidade de implementar o refresh para tokens expirados
          // verificar a necessidade de implementar algum mecanismo para tokens inválidos
          //  - pode ser erro de segurança
          //  - pode ser tentativa de invasão
          console.log('token error')
        }
      },
    };
</script>

<style src="./Layout.scss" lang="scss" />
