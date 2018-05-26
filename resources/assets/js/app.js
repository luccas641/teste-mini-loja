require('./bootstrap');

window.Vue = require('vue');
let VueRouter = require('vue-router').default;
let axios = require('axios');
let Toasted = require('vue-toasted').default;
let VueAxios = require('vue-axios');
let Vuex = require('vuex');

let App = require('./App');
let Cart = require('./components/shopping/Cart');
let Category = require('./components/shopping/Category');
let Categories = require('./components/shopping/Categories');
let Confirm = require('./components/purchase/Confirm');
let Customer = require('./components/user/Customer');
let Home = require('./components/shopping/Home');
let Login = require('./components/user/Login');
let ProductDetail = require('./components/shopping/ProductDetail');
let Register = require('./components/user/Register');
let Search = require('./components/shopping/Search');
let Success = require('./components/purchase/Success');
let PurchaseDetails = require('./components/purchase/Details');

let Store = require('./store');

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
            meta: {
                auth: true
            }
        },
        {
            path: '/confirm',
            name: 'confirm',
            component: Confirm,
            meta: {
                auth: true
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
App.store = Store

const app = new Vue(App).$mount('#app');
