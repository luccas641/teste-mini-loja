<template>
    <div>
        <div class="row">
            <router-link v-for="category in categories.data" :to="{name: 'category', params: {id: category.id}}" :key="category.id" class="col-md-3 col-sm-4 col-xs-12 category">
                <p>{{category.name}}</p>
                {{category.products_count}} produtos

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
                categories: []
            };
        },
        created() {
            this.getResults();
        },
        methods: {
            getResults (page = 1) {
                this.axios.get(`categories?page=${page}`).then((response) => {
                    this.categories = response.data
                })
            }
        }
    }
</script>