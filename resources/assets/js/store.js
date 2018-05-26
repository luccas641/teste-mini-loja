import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex)
const store = new Vuex.Store({
  plugins: [createPersistedState()],
  state: {
    cartId: null,
    user: null,
  },
  mutations: {
    setUser (store, user) {
        store.user = user
    },
    setCart (store, cartId) {
        store.cartId = cartId
    },
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
    }
  },
  getters: {
    cartId: store => store.cartId,
    user: store => store.user,
    isLogged: store => store.user !== null
  }
})

export default store