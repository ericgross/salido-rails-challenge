require 'rails_helper'

describe API::V1::Products do

  before(:each) do
    Product.destroy_all
  end
  let!(:product_1) { Product.create!(
    remote_id: 123,
    name: 'Amazing Wine',
    description: 'description of wine',
    url: 'https://wine.com/123',
    price_retail: 40.99,
    product_type: 0,
    year: 1990,
  )
  }
  let!(:product_2) { Product.create!(
    remote_id: 234,
    name: 'Horrible Wine',
    description: 'description of bad wine',
    url: 'https://wine.com/234',
    price_retail: 10.99,
    product_type: 0,
  )
  }

  describe 'GET /api/v1/products' do

    it 'returns a sucessful return code' do
      get '/api/v1/products'

      expect(response.status).to eq(200)
    end

    it 'returns the proper count' do
      get '/api/v1/products'

      results = JSON.parse(response.body)
      expect(results['count']).to eq(2)
    end

    it 'returns the proper results' do
      get '/api/v1/products'

      products = JSON.parse(response.body).fetch('products')
      expect(products.count).to eq(2)
      expect(products.first.fetch('name')).to eq(product_1.name)
      expect(products.last.fetch('name')).to eq(product_2.name)

      expect(products.first.fetch('year')).to eq(product_1.year)
      expect(products.last.fetch('year')).to eq(product_2.year)
    end

    describe 'POST /api/v1/products' do
      let(:product_id) { Product.first.id }
      let(:params) {
        {
          id: product_id,
          name: product_1.name + ' Modified',
          url: 'https://wine.com/234',
          price_retail: 41.99,
          product_type: 0,
        }
      }

      describe 'valid requests' do

        it 'returns a sucessful return code' do
          post '/api/v1/products', params

          expect(response.status).to eq(201)
        end

        it 'updates the database' do
          post '/api/v1/products', params

          product = Product.find(product_id)
          expect(product.name).to eq(params.fetch(:name))
          expect(product.price_retail).to eq(params.fetch(:price_retail))
        end
      end

      describe 'invalid requests' do
        let(:invalid_params) {
          invalid_params = params.clone
          invalid_params[:name] = nil
          invalid_params
        }

        it 'returns a failure return code' do
          post '/api/v1/products', invalid_params

          expect(response.status).to eq(500)
        end

        it 'does not update the database' do
          post '/api/v1/products', params

          product = Product.find(product_id)
          expect(product.name).to eq(params.fetch(:name))
          expect(product.price_retail).to eq(params.fetch(:price_retail))
        end
      end

    end
  end
end
