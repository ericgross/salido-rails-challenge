module API
  module V1
    class Products < Grape::API
      version 'v1'
      format :json
      rescue_from :all

      resource :products do
        desc 'return all products'

        get do
          Rails.logger.info "Getting products for API"
          {count: Product.count, products: Product.all.sort_by(&:name)}
        end

        desc 'update existing product'
        params do
          requires :id, type: Integer, desc: 'ID for product'
          requires :name, type: String, desc: 'Name of product'
          optional :description, type: String, desc: 'Description of product'
          requires :url, type: String, desc: 'URL of product'
          requires :price_retail, type: Float, desc: 'Retail price of product'
          requires :product_type, type: Integer, desc: 'Product type'
          optional :year, type: Integer, desc: 'Year of product'
        end
        post do
          product = Product.find(params.delete(:id))

          # rather than use hashie-forbidden_attributes we will list the properties
          product.update_attributes!(
            name:         params[:name],
            description:  params[:description],
            url:          params[:url],
            price_retail: params[:price_retail],
            product_type: params[:product_type],
            year:         params[:year],
          )

          {result: :success}
        end
      end
    end
  end
end
