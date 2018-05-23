class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :verify_admin
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @platforms = Platform.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def filter
    @platforms = Platform.all
    @platform = Platform.find(params[:id])
  end

  def search
    @products = Product.search(params[:name])
  end

  # GET /products/new
  def new
    @product = Product.new
    @publishers = Publisher.all
    @platforms = Platform.all
  end

  # GET /products/1/edit
  def edit
    @publishers = Publisher.all
    @platforms = Platform.all
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: admin_product_path(@product) }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_product_path(@product) }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    
    def verify_admin
      group_admin = Userlevel.find_by(level: "Admin")
      if current_user == nil or current_user.userlevel != group_admin
        redirect_to root_path
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:coverbox, :name, :description, :price, :stock_quantity, :discount_percentage, :platform_id, :publisher_id)
    end

    def platform_params
      params.require(:product).permit(:id)
    end


end
