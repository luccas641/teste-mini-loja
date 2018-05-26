const store = new Vuex.Store({
  state: {
    cartId: null,
    user: null,
  },
  mutations: {
    setUser (store, user) {
        store.user = user
    },
    setCart (store, cart) {
        store.cartId = cartId
    },
  },
  actions: {
    requestCart ({commit}) {
        
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

module.exports = store;