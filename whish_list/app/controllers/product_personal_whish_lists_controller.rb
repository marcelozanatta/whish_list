class ProductPersonalWhishListsController < ApplicationController
  before_action :set_product_personal_whish_list, only: [:show, :edit, :update, :destroy]

  # GET /product_personal_whish_lists
  # GET /product_personal_whish_lists.json
  def index
    @product_personal_whish_lists = ProductPersonalWhishList.all
  end

  # GET /product_personal_whish_lists/1
  # GET /product_personal_whish_lists/1.json
  def show
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
        format.html { redirect_to @product_personal_whish_list, notice: 'Product personal whish list was successfully created.' }
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
        format.html { redirect_to @product_personal_whish_list, notice: 'Product personal whish list was successfully updated.' }
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
      format.html { redirect_to product_personal_whish_lists_url, notice: 'Product personal whish list was successfully destroyed.' }
      format.json { head :no_content }
    end
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
end
