class ProductPersonalWhishListsController < ApplicationController
  # before_action :set_product_personal_whish_list, only: [:edit, :update, :destroy]

  # GET /product_personal_whish_lists
  # GET /product_personal_whish_lists.json
  def index
  end

  # GET /product_personal_whish_lists/1
  # GET /product_personal_whish_lists/1.json
  def show
    @personal_whish_list = PersonalWhishList.find(params[:id])
  end

  # POST /product_personal_whish_lists
  # POST /product_personal_whish_lists.json
  def create
    @product_personal_whish_list = ProductPersonalWhishList.where(product_id: params[:product_id], personal_whish_list_id: params[:personal_whish_list_id])

    if (@product_personal_whish_list && params[:quantity] == 0)
      # Deleta registro
      @product_personal_whish_list.first.destroy
      return render :json => { message: "Excluido com sucesso" }
    elsif (@product_personal_whish_list and @product_personal_whish_list.count > 0)
      # Atualiza
      if @product_personal_whish_list.update(product_personal_whish_list_params)
        return render :json => { message: "Atualizado" }
      end
    else
      # Cria novo registro
      @product_personal_whish_list = ProductPersonalWhishList.new(product_personal_whish_list_params)
      if @product_personal_whish_list.save
        return render :json => { message: "Criado com sucesso" }
      end
    end

    return render :json => { message: "Erro ao criar" }
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

  def set_product_personal_whish_list
    @product_personal_whish_list = ProductPersonalWhishList.find(params[:id])
  end

  def product_personal_whish_list_params
    params.require(:product_personal_whish_list).permit(:product_id, :personal_whish_list_id, :quantity)
  end

  def generate_categories_tree(categories)
    tree = []

    categories.each do |category|
      tree.push(
        {
          id: category.id.to_s,
          parent: category.parent_id ? category.parent_id : "#",
          text: category.name,
          state: {
            opened: true,  # is the node open
          },
        }
      )
    end
    return tree
  end
end
