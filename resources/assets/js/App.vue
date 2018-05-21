<template>
    <div class="panel panel-default">
        <div class="panel-heading">
            <nav>
                <ul class="list-inline">
                    <li>
                        <router-link :to="{ name: 'home' }">Início</router-link>
                    </li>
                    <li>
                        <router-link :to="{ name: 'categories' }">Categorias</router-link>
                    </li>
                    <li class="hide-xs">
                        <form @submit.prevent="doSearch">
                            <input placeholder="Pesquisar" class="form-control" v-model="search"></input>
                        </form>
                    </li>
                    <li v-if="!$auth.check()" class="pull-right">
                        <router-link :to="{ name: 'login' }">Entrar</router-link>
                    </li>
                    <li v-if="!$auth.check()" class="pull-right">
                        <router-link :to="{ name: 'register' }">Registrar</router-link>
                    </li>
                    <li v-if="$auth.check()" class="pull-right">
                        <a href="#" @click.prevent="$auth.logout()">Sair</a>
                    </li>
                    <li class="pull-right">
                        <router-link :to="{ name: 'cart' }">Carrinho</router-link>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="panel-body">
            <router-view></router-view>
        </div>
    </div>
</template>


<script>

    export default {
        data () {
            return {
                search: ''
            }
        },
        methods: {
            doSearch() {
                this.$router.push({
                    name: 'search',
                    query: {
                        q: this.search
                    }
                })
            }
        }
    }
</script>