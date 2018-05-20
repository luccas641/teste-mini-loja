<template>
    <div>
        <div class="alert alert-danger" v-if="error && !success">
            <p>Ocorreu um erro.</p>
        </div>
        <div class="alert alert-success" v-if="success">
            <p>Registro efetuado. Você agora pode entrar <router-link :to="{name:'login'}">aqui.</router-link></p>
        </div>
        <form autocomplete="off" v-on:submit="register" v-if="!success">
            <h2>Dados pessoais e acesso:</h2>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.username }">
                <label for="name">Nome</label>
                <input type="text" id="name" class="form-control" v-model="user.name" required>
                <span class="help-block" v-if="error && errors.name">{{ errors.name }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.email }">
                <label for="email">E-mail</label>
                <input type="email" id="email" class="form-control" placeholder="usuario@exemplo.com" v-model="user.email" required>
                <span class="help-block" v-if="error && errors.email">{{ errors.email }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.password }">
                <label for="password">Senha</label>
                <input type="password" id="password" class="form-control" v-model="user.password" required>
                <span class="help-block" v-if="error && errors.password">{{ errors.password }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.password_confirmation }">
                <label for="password_confirmation">Confirmação da Senha</label>
                <input type="password" id="password_confirmation" class="form-control" v-model="user.password_confirmation" required>
                <span class="help-block" v-if="error && errors.password_confirmation">{{ errors.password_confirmation }}</span>
            </div>
            <hr>
            <h2>Dados de envio:</h2>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.code }">
                <label for="code">CEP</label>
                <input type="input" id="code" class="form-control" v-model="user.code" required>
                <span class="help-block" v-if="error && errors.code">{{ errors.code }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.address }">
                <label for="address">Endereço</label>
                <input type="input" id="address" class="form-control" v-model="user.address" required>
                <span class="help-block" v-if="error && errors.address">{{ errors.address }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.suburb }">
                <label for="suburb">Bairro</label>
                <input type="input" id="suburb" class="form-control" v-model="user.suburb" required>
                <span class="help-block" v-if="error && errors.suburb">{{ errors.suburb }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.city }">
                <label for="city">Cidade</label>
                <input type="input" id="city" class="form-control" v-model="user.city" required>
                <span class="help-block" v-if="error && errors.city">{{ errors.city }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.state }">
                <label for="state">Estado</label>
                <input type="input" id="state" class="form-control" v-model="user.state" required>
                <span class="help-block" v-if="error && errors.state">{{ errors.state }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.phone }">
                <label for="phone">Telefone</label>
                <input type="input" id="phone" class="form-control" v-model="user.phone" required>
                <span class="help-block" v-if="error && errors.phone">{{ errors.phone }}</span>
            </div>
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </form>
    </div>
</template>

<script> 
    export default {
        data(){
            return {
                user: {
                    name: '',
                    email: '',
                    password: '',
                    password_confirmation: '',
                    code: '',
                    address: '',
                    suburb: '',
                    city: '',
                    state: '',
                    phone: '',
                },
                error: false,
                errors: {},
                success: false
            };
        },
        methods: {
            register(){
                var app = this
                this.$auth.register({
                    data: app.user,
                    success: function () {
                        app.success = true
                    },
                    error: function (resp) {
                        app.error = true;
                        app.errors = resp.response.data.errors;
                    },
                    redirect: null
                });                
            }
        }
    }
</script>