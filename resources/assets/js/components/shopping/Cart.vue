<template>
    <div class="row">
        <div class="col-sm-12 col-md-12">
            <h1>Carrinho</h1>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Quantidade</th>
                        <th class="text-center">Valor</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(product, key) in products" :key="product.id">
                        <td class="col-sm-8 col-md-6">
                            <div class="media">
                                <router-link :to="{name: 'productDetail', params: {id: product.id}}" class="thumbnail pull-left">
                                    <img class="media-object" :src="product.image" style="width: 72px; height: 72px;">
                                </router-link>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <router-link :to="{name: 'productDetail', params: {id: product.id}}"> {{product.name}}</router-link>
                                    </h4>
                                </div>
                            </div>
                        </td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                            <input type="input" @change="updateItem(key)" class="form-control"  v-model="product.quantity">
                        </td>
                        <td class="col-sm-1 col-md-1 text-center">
                            <strong>{{product.price | monetize }}</strong>
                        </td>
                        <td class="col-sm-1 col-md-1 text-center">
                            <strong>{{product.price * product.quantity | monetize}}</strong>
                        </td>
                        <td class="col-sm-1 col-md-1">
                            <button @click="removeItem(key)" type="button" class="btn btn-danger">
                                <span class="glyphicon glyphicon-remove"></span>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td class="text-right">
                            <h3>Total</h3>
                        </td>
                        <td class="text-right">
                            <h3>
                                <strong>{{this.total | monetize}}</strong>
                            </h3>
                        </td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                            <router-link :to="{name: 'home'}" class="btn btn-default">
                                <span class="glyphicon glyphicon-shopping-cart"></span> Continuar comprando
                            </router-link>
                        </td>
                        <td>
                            <router-link :to="{name: 'confirm'}" type="button" class="btn btn-success">
                                Finalizar
                                <span class="glyphicon glyphicon-play"></span>
                            </router-link>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
<script>
    import {mapGetters} from 'vuex'
    export default {
        data() {
            return {
                products: []
            };
        },
        created() {
            this.getResults();
        },
        computed: {
            ...mapGetters([
                'cartId'
            ]),
            total () {
                if(this.products.length==0) {
                    return "0.00";
                }
                return this.products.reduce((prev, product) => {
                    return prev + (product.price * product.quantity)
                }, 0)
            }
        },
        methods: {
            getResults () {
                this.axios.get(`carts/${this.cartId}`).then((response) => {
                    this.products = response.data.data
                })
            },
            updateItem (id) {
                this.axios.put(`carts/${this.cartId}`, {
                    product: this.products[id].id, 
                    quantity: this.products[id].quantity
                }).then((response) => {
                    this.getResults()
                })
            },
            removeItem (id) {
                this.updateItem(id, 0)
            },
            checkout () {

            }
        }
    }
</script>