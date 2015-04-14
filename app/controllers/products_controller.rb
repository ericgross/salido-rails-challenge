class ProductsController < ApplicationController
  def create
    @product = Product.create(product_params)
    render action: :new unless @product.valid?
  end

  def new
    @product = Product.new
  end

  private

  def product_params
    params.require(:product).permit(:remote_id, :name, :description, :url, :price_retail, :product_type, :year)
  end
end
