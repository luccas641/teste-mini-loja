import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex)
const store = new Vuex.Store({
  plugins: [createPersistedState()],
  state: {
    cartId: null,
    user: null,
    categories: [],
    specs: []
  },
  mutations: {
    setUser (store, user) {
        store.user = user
    },
    setCart (store, cartId) {
        store.cartId = cartId
    },
    setCategories (store, categories) {
      store.categories = categories
    },
    setSpecs (store, specs) {
      store.specs = specs
    }
  },
  actions: {
    requestCart ({commit}) {
      return Vue.axios.get(`carts`).then((response) => {
         commit('setCart', response.data.cartId) 
      })
    },
    setCart ({commit}, cart) {
        commit('setCart', cart)
    },
    setUser ({ commit}, user) {
        commit('setUser', user)
    },
    getCategories ({commit}) {
      return Vue.axios.get(`categories`).then((response) => {
          commit('setCategories', response.data)
      })
    },
    getSpecs ({commit}) {
      return Vue.axios.get(`specs`).then((response) => {
          commit('setSpecs', response.data)
      })
    }
  },
  getters: {
    cartId: store => store.cartId,
    user: store => store.user,
    isLogged: store => store.user !== null,
    categories: store => store.categories,
    specs: store => store.specs
  }
})

export default store