  Vue.component('paginate', VuejsPaginate)

    var app = new Vue({
      el: '#app',
      data: { 
        pagination: {
          totalPages: 5,
          pageRarge: 12,
        },
        categorySelected: {text: ""},
        productNameSearch: null,
        currentPage: 1,
        categories: [],
        products: []
      },
      methods: {
        clickCallback: function(page) {
          this.currentPage = page;
          this.productSearch();
        },

        getProductsByCategory: function(category_id){
          self = this;

          this.productNameSearch = ""

          axios.get('/product_personal_whish_lists/get_product_by_category/' + category_id + '?page=' + this.currentPage )
          .then(function (response) {
            self.products = response.data.products;
            self.pagination.totalPages = response.data.total_pages;

          })
          .catch(function (error) {
            console.log(error);
          })
          .finally(function () {
          });
        },

        productSearch: function(){
          self = this;

          axios.get('/product_personal_whish_lists/product_search?category=' + this.categorySelected.id + '&name=' + this.productNameSearch + '&page=' + this.currentPage  )
          .then(function (response) {
            self.products = response.data.products;
            self.pagination.totalPages = response.data.total_pages;
          })
          .catch(function (error) {
            console.log(error);
          })
          .finally(function () {
          });
        },
       
        formatPrice: function(value) {
            let val = (value/1).toFixed(2).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
        },
        addItemToList: function(){
          console.log("add")
        }
        


      },
      mounted: function(){
        self = this;

        axios.get('/product_personal_whish_lists/get_categories')
          .then(function (response) {
            console.log(response);
            self.categories = response.data

          $('#category-tree').jstree(
            { 'core' : { 'data': response.data}
          });

           $('#category-tree').on("changed.jstree", function (e, data) {
              console.log(data.node);
              app.categorySelected = data.node;
              app.getProductsByCategory(data.node.id);
            });

          })
          .catch(function (error) {
            console.log(error);
          })
          .finally(function () {
          });
      },
      watch: {
        productNameSearch: function(val){
          this.productSearch();
        }
      }
    })