require('./bootstrap');

window.Vue = require('vue');
let VueRouter = require('vue-router').default;
let axios = require('axios');
let VueAxios = require('vue-axios');
let App = require('./App.vue');
let Customer = require('./components/Customer.vue');
let Home = require('./components/Home.vue');
let Register = require('./components/Register.vue');
let Login = require('./components/Login.vue');
let ProductDetail = require('./components/ProductDetail.vue');
let Cart = require('./components/Cart.vue');
let Category = require('./components/Category.vue');
let Categories = require('./components/Categories.vue');
let Search = require('./components/Search.vue');
let Toasted = require('vue-toasted').default;

Vue.use(Toasted)
Vue.use(VueRouter);
Vue.use(VueAxios, axios);

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
            meta: {
                auth: false
            }
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
            path: '/cart',
            name: 'cart',
            component: Cart,
            meta: {
                auth: false
            }
        },
        {
            path: '/products/:id',
            name: 'productDetail',
            component: ProductDetail,
            meta: {
                auth: false
            }
        },
        {
            path: '/categories/:id',
            name: 'category',
            component: Category,
            meta: {
                auth: false
            }
        },
        {
            path: '/categories',
            name: 'categories',
            component: Categories,
            meta: {
                auth: false
            }
        },
        {
            path: '/search',
            name: 'search',
            component: Search,
            meta: {
                auth: false
            }
        }
    ]
});

Vue.router = router

Vue.use(require('@websanova/vue-auth'), {
  auth: require('@websanova/vue-auth/drivers/auth/bearer.js'),
  http: require('@websanova/vue-auth/drivers/http/axios.1.x.js'),
  router: require('@websanova/vue-auth/drivers/router/vue-router.2.x.js'),
})
Vue.component('pagination', require('laravel-vue-pagination'));
Vue.filter('monetize', function (value) {
    value = String(parseFloat(value).toFixed(2))
    value = value.replace('.', ',')
    return `R$ ${value}`
  })
  
App.router = Vue.router

const app = new Vue(App).$mount('#app');
