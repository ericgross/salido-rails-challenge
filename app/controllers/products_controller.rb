class ProductsController < ApplicationController
  def create
    @product = Product.create(product_params)
    render action: :new unless @product.valid?
  end

  def new
    @product = Product.new
  end

  def index
    @products = Product.all.sort_by(&:name)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    render action: :edit unless @product.valid?

    redirect_to action: :index
  end

  private

  def product_params
    params.require(:product).permit(:remote_id, :name, :description, :url, :price_retail, :product_type, :year)
  end
end
