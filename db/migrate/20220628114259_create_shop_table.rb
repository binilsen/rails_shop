class CreateShopTable < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: false do |t|
      t.integer :product_id, primary_key: true
      t.string :product_name
      t.text :product_title
      t.integer :product_weight
      t.float :product_price
      t.timestamps
    end

    create_table :carts,id:false do |t|
      t.integer :cart_id, primary_key: true
      t.timestamps
    end
    create_table :carts_products do |t|
      t.belongs_to :product
      t.belongs_to :cart
      t.timestamps
    end
  end
end
