import Vue from 'vue'
import Router from 'vue-router'

import Layout from '@/components/Layout/Layout'

// Pages
import Dashboard from '@/pages/Dashboard/Dashboard'


import Error from "@/pages/Error/Error"
// import Login from "@/pages/Login/Login"


//User
// import Profile from "@/pages/User/Profile/Profile"

// import {isAuthenticated} from "./mixins/auth";

import Marca from "@/pages/Marca"
import Categoria from "@/pages/Categoria"
import Produto from "@/pages/Produto"
import Venda from "@/pages/Venda"

Vue.use(Router);

export default new Router({
  routes: [
    // {
    //   path: '/login',
    //   name: 'Login',
    //   component: Login
    // },
    {
      path: '/',
      redirect: 'venda',
      name: 'Layout',
      component: Layout,
      // beforeEnter: (to, from, next) => {
      //   let token = localStorage.getItem('token');
      //   isAuthenticated(token) ? next() : next({path: '/login'})
      // },
      children: [
        {
          path: '/categoria',
          name: 'Categoria',
          component: Categoria,
        },
        {
          path: '/marca',
          name: 'Marca',
          component: Marca,
        },
        {
          path: '/produto',
          name: 'Produto',
          component: Produto,
        },
        {
          path: '/dashboard',
          name: 'Dashboard',
          component: Dashboard,
        },
        {
          path: '/venda',
          name: 'Venda',
          component: Venda,
        },
        // {
        //   path: '/user/profile',
        //   name: 'Profile',
        //   component: Profile
        // }
      ],
    },
    {
      path: '*',
      name: 'Error',
      component: Error
    }
  ],
});
