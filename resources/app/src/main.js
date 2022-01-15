import Vue from 'vue'
import App from './App.vue'
import router from './router'
import vuetify from './plugins/vuetify'
import VueMask from 'v-mask'
// import money from 'v-money'

// register directive v-money and component <money>
// Vue.use(money, {
//   // precision: 4
//   decimal: ',',
//   thousands: '.',
//   prefix: 'R$ ',
//   suffix: ' #',
//   precision: 2,
//   masked: false /* doesn't work with directive */
// })

Vue.use(VueMask)

Vue.config.productionTip = false

new Vue({
  router,
  vuetify,
  render: h => h(App)
}).$mount('#app')
