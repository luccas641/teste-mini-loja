<template>
    <div>
        <div class="row">
            <router-link v-for="order in orders.data" :to="{name: 'purchaseDetail', params: {id: order.id}}" :key="order.id" class="col-md-3 col-sm-4 col-xs-12 category">
                <p>{{order.created_at}}</p>
                <p>{{order.total | monetize}}</p>
                {{order.products_count}} produto(s)

            </router-link>
        </div>
    </div>
</template>

<style>
    .category {
        background-color:cadetblue;
        color: #efefef;
        padding: 10px;
        margin: 10px;
        border-radius: 5px;
    }

    .category p {
        font-weight: bold;
    }

    .category:hover {
        color: white;
    }
</style>

<script>
    export default {
        components: {
        },
        data() {
            return {
                orders: []
            };
        },
        created() {
            this.getResults();
        },
        methods: {
            getResults (page = 1) {
                this.axios.get(`orders?page=${page}`).then((response) => {
                    this.orders = response.data
                })
            }
        }
    }
</script>