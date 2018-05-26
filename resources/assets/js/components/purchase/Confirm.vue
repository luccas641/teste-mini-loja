<template>
    <div v-if="!$auth.check()">
        <p>Por favor, entre com seus dados antes de continuar:</p>
        <login redirect="/confirm"></login>
    </div>
    <div v-else>
        <div class="alert alert-danger" v-if="error">
            <p>Ocorreu um erro.</p>
        </div>
        <form autocomplete="off" v-on:submit="confirm">
            <p>Por favor, confirme os dados para entrega:</p>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.code }">
                <label for="code">CEP</label>
                <input type="input" id="code" class="form-control" v-model="shipping.code" required>
                <span class="help-block" v-if="error && errors.code">{{ errors.code }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.address }">
                <label for="address">Endereço</label>
                <input type="input" id="address" class="form-control" v-model="shipping.address" required>
                <span class="help-block" v-if="error && errors.address">{{ errors.address }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.suburb }">
                <label for="suburb">Bairro</label>
                <input type="input" id="suburb" class="form-control" v-model="shipping.suburb" required>
                <span class="help-block" v-if="error && errors.suburb">{{ errors.suburb }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.city }">
                <label for="city">Cidade</label>
                <input type="input" id="city" class="form-control" v-model="shipping.city" required>
                <span class="help-block" v-if="error && errors.city">{{ errors.city }}</span>
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.state }">
                <label for="state">Estado</label>
                <input type="input" id="state" class="form-control" v-model="shipping.state" required>
                <span class="help-block" v-if="error && errors.state">{{ errors.state }}</span>
            </div>
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </form>
    </div>
</template>

<script> 
    import Login from '../user/Login'
    import {mapGetters} from 'vuex'
    export default {
        data(){
            return {
                user: null,
                shipping: {
                    code: '',
                    address: '',
                    suburb: '',
                    city: '',
                    state: '',
                    phone: '',
                },
                error: false,
                errors: {},
            };
        },
        components: {
            Login
        },
        computed: {
            ...mapGetters([
                'cartId'
            ])
        },
        created () {
            if(this.$auth.check()) {
                this.user = this.$auth.user();
                this.shipping.code = this.user.code;
                this.shipping.address = this.user.address;
                this.shipping.suburb = this.user.suburb;
                this.shipping.city = this.user.city;
                this.shipping.state = this.user.state;
                this.shipping.phone = this.user.phone;
            }
        },
        methods: {
            confirm () {
                console.log('confirm')
                this.axios.post(`orders`, {
                    cart: this.cartId,
                    shipping: this.shipping
                })
                .then((response) => {
                    this.category = response.data
                })
                .catch((err) => {
                    this.error = true;
                    this.errors = response.data.errors;
                })
            }
        }
    }
</script>