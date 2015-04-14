class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :remote_id,     null: false
      t.string  :name,          null: false
      t.string  :description
      t.string  :url,           null: false
      t.float   :price_retail,  null: false
      t.integer :product_type,  null: false
      t.integer :year

      t.timestamps null: false
    end
  end
end
