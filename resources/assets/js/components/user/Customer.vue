<template>
    <div>
        <h1>Pagina do cliente</h1>
        <list-orders></list-orders>
    </div>
</template>


<script>
    import ListOrders from '../purchase/List'
    export default {
        components: {
            ListOrders
        }
    }
</script>