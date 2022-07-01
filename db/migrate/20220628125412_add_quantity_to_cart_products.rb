class AddQuantityToCartProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts_products, :product_quantity, :integer, :default => 1
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
