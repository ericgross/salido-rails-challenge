# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  remote_id    :integer          not null
#  name         :string           not null
#  description  :string
#  url          :string           not null
#  price_retail :float            not null
#  product_type :integer          not null
#  year         :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ActiveRecord::Base
  enum product_type: [:wine, :wine_set, :basket, :glassware, :accessory]

  validates_presence_of :remote_id, :name, :url, :price_retail, :product_type
  validates_uniqueness_of :remote_id

  def self.create_or_replace!(remote_id:, name: , description:, url:, price_retail:, product_type:, year:)
    product = self.where(remote_id: remote_id).first
    binding.pry
    product ||= self.create!(
      remote_id: remote_id,
      name: name,
      description: description,
      url: url,
      price_retail: price_retail,
      product_type: product_type,
      year: year
    )
  end

end
