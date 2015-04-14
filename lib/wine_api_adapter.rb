class WineApiAdapter
  include HTTParty

  base_uri 'http://services.wine.com/api/beta2/service.svc/json'
  default_params apikey: ENV.fetch('WINE_API_KEY')

  def store_products
    options = Hash.new
    options[:query] = {size: 100, offset: 0}
    while (ProductAdapter.count < 2000)
      response = self.class.get('/catalog', options)
      process_response(response: response)

      options[:query][:offset] += 100
    end

    true
  end

  def process_response(response:)
    raise response.response unless response.success?

    product_hashes = response.fetch('Products').fetch('List')
    product_hashes.each do |product_hash|
      ProductAdapter.store!(product_hash: product_hash)
    end
  end

end
