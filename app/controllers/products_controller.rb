class ProductsController < ApplicationController
  def index
    @products = ProductService.all
  end

  def show
    @product = ProductService.find(product_id)
  end

  def new
    @product = ProductService.new
  end

  def create
    @product = ProductService.create(product_params)

    respond_to do |format|
      if @product.persisted?
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @product = ProductService.find(product_id)
  end

  def update
    @product = ProductService.update(product_id, product_params)

    respond_to do |format|
      if @product.valid?
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    ProductService.remove(params[:id])

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def product_id
    params[:id]
  end

  def product_params
    params.require(:product).permit(:name, :category, :price, :color, :icon)
  end
end
