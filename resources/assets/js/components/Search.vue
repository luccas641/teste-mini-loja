<template>
    <div>
        <product-item-list v-for="product in products.data" :product="product" :key="product.id"></product-item-list>
    </div>
</template>


<script>
    let ProductItemList = require('./ProductItemList.vue');
    export default {
        components: {
            ProductItemList
        },
        data() {
            return {
                products: []
            };
        },
        created() {
            this.axios.get('products').then((response) => {
                this.products = response.data
            })
        },
        methods: {

        }
    }
</script>