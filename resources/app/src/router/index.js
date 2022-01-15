import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/marca',
    name: 'Marca',
    component: () => import(/* webpackChunkName: "marca" */ '../views/Marca.vue')
  },
  {
    path: '/categoria',
    name: 'Categoria',
    component: () => import(/* webpackChunkName: "categoria" */ '../views/Categoria.vue')
  },
  {
    path: '/produto',
    name: 'Produto',
    component: () => import(/* webpackChunkName: "produto" */ '../views/Produto.vue')
  },
  {
    path: '/venda',
    name: 'Venda',
    component: () => import(/* webpackChunkName: "venda" */ '../views/Venda.vue')
  },
  {
    path: '/relatorio-vendas',
    name: 'RelatorioVenda',
    component: () => import(/* webpackChunkName: "relatorio-venda" */ '../views/RelatorioVenda.vue')
  },
  {
    path: '*',
    name: 'Error',
    component: Error
  }


]

const router = new VueRouter({
  routes
})

export default router
