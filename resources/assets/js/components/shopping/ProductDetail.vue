<template>
    <div v-if="product">
        <div class="row">
            <div class="col-xs-12">
            <router-link v-for="category in product.categories" :to="{name: 'category', params: {id: category.id}}" :key="category.id">| {{category.name}} |</router-link>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-5 item-photo">
                <img style="max-width:100%;" :src="product.image"/>
            </div>
            <div class="col-xs-7" style="border:0px solid gray">
                <!-- Datos del vendedor y titulo del producto -->
                <h3>{{product.name}}</h3>

                <!-- Precios -->
                <h6 class="title-price">
                    <small>Preço em oferta!</small>
                </h6>
                <h3 style="margin-top:0px;">{{product.price | monetize}}</h3>

                <!-- Detalles especificos del producto -->

                <div class="section" style="padding-bottom:20px;">
                    <h6 class="title-attr">
                        <small>Quantidade</small>
                    </h6>
                    <div>
                        <div class="btn-minus"  @click="decrease">
                            <span class="glyphicon glyphicon-minus"></span>
                        </div>
                        <input v-model="quantity" />
                        <div class="btn-plus"  @click="increase">
                            <span class="glyphicon glyphicon-plus"></span>
                        </div>
                    </div>
                </div>

                <!-- Botones de compra -->
                <div class="section" style="padding-bottom:20px;">
                    <button @click="addToCart" class="btn btn-success">
                        <span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Adicionar ao carrinho</button>
                    
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <h2>Detalhes do Produto</h2>
                <div v-html="product.details || 'Produto sem detalhes'" style="width:100%;border-top:1px solid silver">        
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <h2>Características</h2>
                <table class="table table-striped">
                    <tbody>
                        <tr v-for="spec in product.specs" :key="spec.id">
                            <td><strong>{{spec.name}}</strong></td>
                            <td>{{spec.pivot.value}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    
    import {mapGetters} from 'vuex'
    export default {
        data() {
            return {
                product: null,
                quantity: 1
            };
        },
        computed: {
            ...mapGetters([
                'cartId'
            ]),
        },
        created() {
            this.axios.get(`products/${this.$route.params.id}`).then((response) => {
                this.product = response.data.data
            })
        },
        methods: {
            decrease () {
                this.quantity = Math.max(1, this.quantity-1)
            },
            increase () {
                this.quantity++
            },
            addToCart () {
                this.axios.put(`carts/${this.cartId}`, {
                    product: this.product.id,
                    quantity: this.quantity
                }).then(() => {
                    this.$toasted.show('Item adicionado ao carrinho!').goAway(1500);
                })
            }
        }
    }
</script>
<style>
    ul>li {
        margin-right: 25px;
        font-weight: lighter;
        cursor: pointer
    }

    li.active {
        border-bottom: 3px solid silver;
    }

    .item-photo {
        display: flex;
        justify-content: center;
        align-items: center;
        border-right: 1px solid #f6f6f6;
    }

    .menu-items {
        list-style-type: none;
        font-size: 11px;
        display: inline-flex;
        margin-bottom: 0;
        margin-top: 20px
    }

    .btn-success {
        width: 100%;
        border-radius: 0;
    }

    .section {
        width: 100%;
        margin-left: -15px;
        padding: 2px;
        padding-left: 15px;
        padding-right: 15px;
        background: #f8f9f9
    }

    .title-price {
        margin-top: 30px;
        margin-bottom: 0;
        color: black
    }

    .title-attr {
        margin-top: 0;
        margin-bottom: 0;
        color: black;
    }

    .btn-minus {
        cursor: pointer;
        font-size: 7px;
        display: flex;
        align-items: center;
        padding: 5px;
        padding-left: 10px;
        padding-right: 10px;
        border: 1px solid gray;
        border-radius: 2px;
        border-right: 0;
    }

    .btn-plus {
        cursor: pointer;
        font-size: 7px;
        display: flex;
        align-items: center;
        padding: 5px;
        padding-left: 10px;
        padding-right: 10px;
        border: 1px solid gray;
        border-radius: 2px;
        border-left: 0;
    }

    div.section>div {
        width: 100%;
        display: inline-flex;
    }

    div.section>div>input {
        margin: 0;
        padding-left: 5px;
        font-size: 10px;
        padding-right: 5px;
        max-width: 18%;
        text-align: center;
    }

    .attr,
    .attr2 {
        cursor: pointer;
        margin-right: 5px;
        height: 20px;
        font-size: 10px;
        padding: 2px;
        border: 1px solid gray;
        border-radius: 2px;
    }

    .attr.active,
    .attr2.active {
        border: 1px solid orange;
    }

    @media (max-width: 426px) {
        .container {
            margin-top: 0px !important;
        }
        .container>.row {
            padding: 0 !important;
        }
        .container>.row>.col-xs-12.col-sm-5 {
            padding-right: 0;
        }
        .container>.row>.col-xs-12.col-sm-9>div>p {
            padding-left: 0 !important;
            padding-right: 0 !important;
        }
        .container>.row>.col-xs-12.col-sm-9>div>ul {
            padding-left: 10px !important;

        }
        .section {
            width: 104%;
        }
        .menu-items {
            padding-left: 0;
        }
    }
</style>