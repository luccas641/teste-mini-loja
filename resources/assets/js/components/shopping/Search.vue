<template>
  <div>
    <div class="col-sm-3 col-md-3">
      <div class="panel-group" id="accordion">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#facets-1">
                <span class="glyphicon glyphicon-tag"></span> Categorias</a>
            </h4>
          </div>
          <div id="facets-1" class="panel-collapse collapse in">
            <ul class="list-group">
              <div class="list-group-item" v-for="category in categories.data" :key="category.id">
                <input type="checkbox" v-model="searchCategories" :value="category.id" :name="'cat'+category.id"/>
                <label :for="'cat'+category.id">{{category.name}}</label>
              </div>
            </ul>
          </div>
        </div>
        <!--<div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#facets-2">
                <span class="glyphicon glyphicon-tag"></span> Características</a>
            </h4>
          </div>
          <div id="facets-2" class="panel-collapse collapse in">
            <ul class="list-group">
              <div class="list-group-item" v-for="spec in specs.data" :key="spec.id">
                <input type="checkbox" v-model="searchSpecs" :value="spec.id" :name="'spec' + spec.id"  />
                <label :for="'spec' + spec.id">{{spec.name}}</label>
              </div>
            </ul>
          </div>
        </div>-->
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a data-toggle="collapse" href="#collapse-2">
                <span class="glyphicon glyphicon-tag"></span> Preço</a>
            </h4>
          </div>
          <div id="collapse-2" class="panel-collapse collapse in">
            <ul class="list-group">
              <div class="list-group-item">
                <div class="input-group">
                  <input type="text" class="form-control" v-model="priceMin" />
                  <div class="input-group-addon">até</div>
                  <input type="text" class="form-control" v-model="priceMax" />
                </div>                
              </div>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-9 col-md-9">
    <product-item-list v-for="product in products.data" :product="product" :key="product.id"></product-item-list>
    <div v-if="products.data.length==0">
      Nenhum resultado encontrado.
    </div>
    </div>
  </div>
</template>


<script>
  import ProductItemList from './ProductItemList.vue'
  import {mapGetters, mapActions} from 'vuex'
  export default {
    components: {
      ProductItemList
    },
    data() {
      return {
        products: [],
        priceMin: 0,
        priceMax: 0,
        searchCategories: [],
        searchSpecs: [],
      };
    },
    computed: {
      ...mapGetters([
        'categories',
        'specs'
      ]),
      specsIds () {
        return this.searchSpecs.join(',')
      },
      categoriesIds () {
        return this.searchCategories.join(',')
      },
      q() {
        return this.$route.query.q
      }
    },
    watch: {
      q() {
        this.doSearch();
      },
      searchCategories: {
        deep: true,
        handler () {
          this.doSearch();
        }
      },
      searchSpecs: {
        deep: true,
        handler () {
          this.doSearch();
        }
      },
      priceMin () {
          this.doSearch();

      },
      priceMax () {
          this.doSearch();

      }
    },
    mounted() {
      this.doSearch();
    },
    methods: {
      doSearch() {
        this.axios.get(`products/search/${this.q}?priceMin=${this.priceMin}&priceMax=${this.priceMax}&categories=[${this.categoriesIds}]&specs=[${this.specsIds}]`).then((response) => {
          this.products = response.data
        })
      }
    }
  }
</script>

<style>
  #accordion .glyphicon {
    margin-right: 10px;
  }

  .panel-collapse>.list-group .list-group-item:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0;
  }

  .panel-collapse>.list-group .list-group-item {
    border-width: 1px 0;
  }

  .panel-collapse>.list-group {
    margin-bottom: 0;
  }

  .panel-collapse .list-group-item {
    border-radius: 0;
  }

  .panel-collapse .list-group .list-group {
    margin: 0;
    margin-top: 10px;
  }

  .panel-collapse .list-group-item li.list-group-item {
    margin: 0 -15px;
    border-top: 1px solid #ddd !important;
    border-bottom: 0;
    padding-left: 30px;
  }

  .panel-collapse .list-group-item li.list-group-item:last-child {
    padding-bottom: 0;
  }

  .panel-collapse div.list-group div.list-group {
    margin: 0;
  }

  .panel-collapse div.list-group .list-group a.list-group-item {
    border-top: 1px solid #ddd !important;
    border-bottom: 0;
    padding-left: 30px;
  }

  .panel-collapse .list-group-item li.list-group-item {
    border-top: 1px solid #DDD !important;
  }
</style>