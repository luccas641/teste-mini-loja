<template>
    <router-link :to="{ name: 'productDetail', params: { id: product.id }}" class="col-xs-12 col-sm-6 col-md-4">
        <div class="thumbnail" >
            <img :src="product.image" class="img-responsive">
            <div class="caption">
                <div class="row">
                    <div class="col-md-12 price">
                        <h3 style="margin:5px auto;"><label>{{product.price | monetize}}</label></h3>
                    </div>
                </div>

                <p class="prodname">{{product.name}}</p>
                    
                <a @click.stop="addToCart(product.id)" href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Comprar</a>
                    
            </div>
        </div>
    </router-link>
</template>
<script> 
    import {mapGetters} from 'vuex'
    export default {
        props: ['product'],
        computed: {
            ...mapGetters([
                'cartId'
            ]),
        },
        methods: {
            addToCart (id) {
                this.axios.put(`carts/${this.cartId}`, {
                    product: id,
                    quantity: 1
                }).then(() => {
                    this.$toasted.show('Item adicionado ao carrinho!').goAway(1500);
                })
            }
        }
    }
</script>

<style>
.prodname{
    white-space: nowrap;
    text-overflow: ellipsis;
    max-width: 100%;
    overflow: hidden;

}
</style>