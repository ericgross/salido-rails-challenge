require 'rails_helper'

describe API::V1::Products do
  describe 'GET /api/v1/products' do
    before(:each) do
      Product.create!(
        remote_id: 123,
        name: 'Amazing Wine',
        description: 'description of wine',
        url: 'https://wine.com/123',
        price_retail: 40.99,
        product_type: 0,
        year: 1990,
      )

      Product.create!(
        remote_id: 234,
        name: 'Horrible Wine',
        description: 'description of bad wine',
        url: 'https://wine.com/234',
        price_retail: 10.99,
        product_type: 0,
      )
    end

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
      expect(products.first.fetch('name')).to eq('Amazing Wine')
      expect(products.last.fetch('name')).to eq('Horrible Wine')

      expect(products.first.fetch('year')).to eq(1990)
      expect(products.last.fetch('year')).to be_nil
    end


  end
end
