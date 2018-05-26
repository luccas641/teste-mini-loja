<template>
    <div v-if="category">
        <div class="row">

            <product-item-list v-for="product in category.data.products.data" :product="product" :key="product.id"></product-item-list>
        </div>
        <div class="row">
            <div class="col-xs-12" >
                <pagination :data="category.data.products" @pagination-change-page="getResults"></pagination>
            </div>
        </div>
    </div>
</template>


<script>
    let ProductItemList = require('./ProductItemList.vue');
    export default {
        components: {
            ProductItemList,
        },
        data() {
            return {
                category: null
            };
        },
        created() {
            this.getResults();
        },
        methods: {
            getResults (page = 1) {
                this.axios.get(`categories/${this.$route.params.id}?page=${page}`).then((response) => {
                    this.category = response.data
                })
            }
        }
    }
</script>