<template>
    <div>
        <p>Por favor, confirme os dados para entrega:</p>
        <div class="alert alert-danger" v-if="error && !success">
            <p>Ocorreu um erro.</p>
        </div>
        <form autocomplete="off" v-on:submit="confirm">
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
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </form>
    </div>
</template>

<script> 
    export default {
        data(){
            return {
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
        created () {
            
        },
        methods: {
            confirm () {
                this.axios.post(`orders`, {
                    cart: 1,
                    shipping: shipping
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