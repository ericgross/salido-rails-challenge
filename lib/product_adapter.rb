class ProductAdapter
  def self.store!(product_hash:)
    Product.connection

    return if product_hash.fetch('Type').empty?

    product_type = product_hash.fetch('Type').downcase
    product_type = 'wine_set' if product_type == 'wineset'

    Product.create_or_replace!(
      remote_id:    product_hash.fetch('Id'),
      name:         product_hash.fetch('Name'),
      description:  product_hash.fetch('Description'),
      url:          product_hash.fetch('Url'),
      price_retail: product_hash.fetch('PriceRetail'),
      product_type: product_type,
      year:         product_hash.fetch('Year') {},
    )

    Rails.logger.info "Saving product" 
  end

  def self.count
    Product.count
  end
end
