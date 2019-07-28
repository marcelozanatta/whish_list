class PersonalWhishListsController < ApplicationController
  before_action :set_personal_whish_list, only: [:show, :edit, :update, :destroy]

  # GET /personal_whish_lists
  # GET /personal_whish_lists.json
  def index
    @personal_whish_lists = PersonalWhishList.all
  end

  # GET /personal_whish_lists/1
  # GET /personal_whish_lists/1.json
  def show
  end

  # GET /personal_whish_lists/new
  def new
    @personal_whish_list = PersonalWhishList.new
  end

  # GET /personal_whish_lists/1/edit
  def edit
  end

  # POST /personal_whish_lists
  # POST /personal_whish_lists.json
  def create
    @personal_whish_list = PersonalWhishList.new(personal_whish_list_params)

    respond_to do |format|
      if @personal_whish_list.save
        format.html { redirect_to @personal_whish_list, notice: 'Personal whish list was successfully created.' }
        format.json { render :show, status: :created, location: @personal_whish_list }
      else
        format.html { render :new }
        format.json { render json: @personal_whish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_whish_lists/1
  # PATCH/PUT /personal_whish_lists/1.json
  def update
    respond_to do |format|
      if @personal_whish_list.update(personal_whish_list_params)
        format.html { redirect_to @personal_whish_list, notice: 'Personal whish list was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_whish_list }
      else
        format.html { render :edit }
        format.json { render json: @personal_whish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_whish_lists/1
  # DELETE /personal_whish_lists/1.json
  def destroy
    @personal_whish_list.destroy
    respond_to do |format|
      format.html { redirect_to personal_whish_lists_url, notice: 'Personal whish list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_whish_list
      @personal_whish_list = PersonalWhishList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_whish_list_params
      params.require(:personal_whish_list).permit(:name)
    end
end
