require('./bootstrap')

import Vue from 'vue'
import VueRouter from 'vue-router'
import axios from 'axios'
import Toasted from 'vue-toasted'
import VueAxios from 'vue-axios'
import Vuex from 'vuex'

import App from './App'
import Cart from './components/shopping/Cart'
import Category from './components/shopping/Category'
import Categories from './components/shopping/Categories'
import Confirm from './components/purchase/Confirm'
import Customer from './components/user/Customer'
import Home from './components/shopping/Home'
import Login from './components/user/Login'
import ProductDetail from './components/shopping/ProductDetail'
import Register from './components/user/Register'
import Search from './components/shopping/Search'
import Success from './components/purchase/Success'
import PurchaseDetails from './components/purchase/Details'

import Store from './store'

Vue.use(Toasted)
Vue.use(VueRouter)
Vue.use(VueAxios, axios)
window.Vue = Vue
axios.defaults.baseURL = 'http://localhost/api';

const router = new VueRouter({
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home
        },
        {
            path: '/register',
            name: 'register',
            component: Register,
        },
        {
            path: '/login',
            name: 'login',
            component: Login,
            meta: {
                auth: false
            }
        },
        {
            path: '/customer',
            name: 'customer',
            component: Customer,
            meta: {
                auth: true
            }
        },
        {
            path: '/purchaseDetail/:id',
            name: 'purchaseDetail',
            component: PurchaseDetails,
            meta: {
                auth: true
            }
        },
        {
            path: '/cart',
            name: 'cart',
            component: Cart,
        },
        {
            path: '/products/:id',
            name: 'productDetail',
            component: ProductDetail,
        },
        {
            path: '/categories/:id',
            name: 'category',
            component: Category,
        },
        {
            path: '/categories',
            name: 'categories',
            component: Categories,
        },
        {
            path: '/search',
            name: 'search',
            component: Search,
        },
        {
            path: '/success',
            name: 'success',
            component: Success,
        },
        {
            path: '/confirm',
            name: 'confirm',
            component: Confirm,
            
        }
    ]
})

Vue.router = router

Vue.use(require('@websanova/vue-auth'), {
  auth: require('@websanova/vue-auth/drivers/auth/bearer.js'),
  http: require('@websanova/vue-auth/drivers/http/axios.1.x.js'),
  router: require('@websanova/vue-auth/drivers/router/vue-router.2.x.js'),
})
Vue.component('pagination', require('laravel-vue-pagination'))
Vue.filter('monetize', function (value) {
    value = String(parseFloat(value).toFixed(2))
    value = value.replace('.', ',')
    return `R$ ${value}`
  })
  
App.router = Vue.router
App.store = Store

const app = new Vue(App).$mount('#app')
