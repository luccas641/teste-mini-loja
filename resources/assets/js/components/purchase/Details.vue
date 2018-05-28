<template>
    <div class="row" v-if="order">
        <div class="col-sm-12 col-md-12">
            <h1>Detalhes da compra</h1>
            <h2>Dados de entrega</h2>
            <div class="row">
                <div class="col-md-6">
                    <strong>Endereço</strong> {{order.address}}
                </div>
                <div class="col-md-6">
                    <strong>Bairro</strong> {{order.suburb}}
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <strong>Cidade</strong> {{order.city}}
                </div>
                <div class="col-md-6">
                    <strong>Estado</strong> {{order.state}}
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <strong>CEP</strong> {{order.code}}
                </div>
                <div class="col-md-6">
                    <strong>Telefone</strong> {{order.phone}}
                </div>
            </div>
            <h2>Produtos</h2>
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
                    <tr v-for="(product) in order.products" :key="product.id">
                        <td class="col-sm-9 col-md-9">
                            <div class="media">
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <router-link :to="{name: 'productDetail', params: {id: product.id}}"> {{product.name}}</router-link>
                                    </h4>
                                </div>
                            </div>
                        </td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                            <input type="input" disabled class="form-control"  v-model="product.pivot.quantity">
                        </td>
                        <td class="col-sm-1 col-md-1 text-center">
                            <strong>{{product.pivot.price | monetize }}</strong>
                        </td>
                        <td class="col-sm-1 col-md-1 text-center">
                            <strong>{{product.pivot.price * product.pivot.quantity | monetize}}</strong>
                        </td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td class="text-right" colspan="3">
                            <h3>
                             Total   <strong>{{this.total | monetize}}</strong>
                            </h3>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                order: null
            };
        },
        created() {
            this.getResults();
        },
        computed: {
            total () {
                if(this.order == null) {
                    return "0.00";
                }
                return this.order.products.reduce((prev, product) => {
                    return prev + (product.pivot.price * product.pivot.quantity)
                }, 0)
            }
        },
        methods: {
            getResults () {
                this.axios.get(`orders/${this.$route.params.id}`).then((response) => {
                    this.order = response.data.data
                })
            },
        }
    }
</script>