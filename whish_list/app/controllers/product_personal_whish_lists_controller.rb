class ProductPersonalWhishListsController < ApplicationController
  before_action :set_product_personal_whish_list, only: [:edit, :update, :destroy]

  # GET /product_personal_whish_lists
  # GET /product_personal_whish_lists.json
  def index
  end

  # GET /product_personal_whish_lists/1
  # GET /product_personal_whish_lists/1.json
  def show
    @personal_whish_list = PersonalWhishList.find(params[:id])
  end

  # GET /product_personal_whish_lists/new
  def new
    @product_personal_whish_list = ProductPersonalWhishList.new
  end

  # GET /product_personal_whish_lists/1/edit
  def edit
  end

  # POST /product_personal_whish_lists
  # POST /product_personal_whish_lists.json
  def create
    @product_personal_whish_list = ProductPersonalWhishList.new(product_personal_whish_list_params)

    respond_to do |format|
      if @product_personal_whish_list.save
        format.html { redirect_to @product_personal_whish_list, notice: "Product personal whish list was successfully created." }
        format.json { render :show, status: :created, location: @product_personal_whish_list }
      else
        format.html { render :new }
        format.json { render json: @product_personal_whish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_personal_whish_lists/1
  # PATCH/PUT /product_personal_whish_lists/1.json
  def update
    respond_to do |format|
      if @product_personal_whish_list.update(product_personal_whish_list_params)
        format.html { redirect_to @product_personal_whish_list, notice: "Product personal whish list was successfully updated." }
        format.json { render :show, status: :ok, location: @product_personal_whish_list }
      else
        format.html { render :edit }
        format.json { render json: @product_personal_whish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_personal_whish_lists/1
  # DELETE /product_personal_whish_lists/1.json
  def destroy
    @product_personal_whish_list.destroy
    respond_to do |format|
      format.html { redirect_to product_personal_whish_lists_url, notice: "Product personal whish list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_categories()
    tree = []
    categories = Category.all
    tree = generate_categories_tree(categories)
    render :json => tree
  end

  def get_product_by_category
    #byebug
    products = Product.get_by_category(params[:id])
    pagined_products = products.page(params[:page])
    render :json => { products: pagined_products, total_items: products.count, total_pages: pagined_products.total_pages, current_page: pagined_products.current_page }
  end

  #Metodo de busca para o produto
  def product_search()
    product = nil
    if (params[:category] != nil and params[:category].to_i > 0)
      products = Product.get_by_category(params[:category]).where("lower(name) like ?", "%#{params[:name].to_s.downcase}%")
    else
      products = Product.where("lower(name) like ?", "%#{params[:name].to_s.downcase}%")
    end
    pagined_products = products.page(params[:page])
    render :json => { products: pagined_products, total_items: products.count, total_pages: pagined_products.total_pages, current_page: pagined_products.current_page }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_personal_whish_list
    @product_personal_whish_list = ProductPersonalWhishList.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_personal_whish_list_params
    params.require(:product_personal_whish_list).permit(:product, :personal_wish_list, :quantity)
  end

  # def generate_category_tree(category)
  #   node = {
  #     text: category.name,
  #     href: get_product_by_category_product_personal_whish_lists_path(category.id),
  #   }

  #   nodes = []

  #   category.childrens.each do |child|
  #     nodes.push(generate_category_tree(child))
  #   end

  #   if nodes.length > 0
  #     node[:nodes] = nodes
  #   end

  #   return node
  # end

  def generate_categories_tree(categories)
    tree = []

    categories.each do |category|
      tree.push(
        {
          id: category.id.to_s,
          parent: category.parent_id ? category.parent_id : "#",
          text: category.name,
          #icon: "string" // string for custom
          state: {
            opened: true,  # is the node open
          },
        #li_attr     : {}  // attributes for the generated LI node
        #a_attr      : {}  // attributes for the generated A node
        }
      )
    end

    p tree

    return tree
  end
end
