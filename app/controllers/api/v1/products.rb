module API
  module V1
    class Products < Grape::API
      version 'v1'
      format :json

      resource :products do
        desc 'return all products'

        get do
          Rails.logger.info "Getting products for API"
          {count: Product.count, products: Product.all}
        end

      end
    end
  end
end
