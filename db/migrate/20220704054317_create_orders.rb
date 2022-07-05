class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders,id:false do |t|
      t.integer :order_id,primary_key: true
      t.belongs_to :cart 
      t.belongs_to :user
      t.integer :order_total
      t.integer :order_tax
      t.integer :order_status ,default:0
      t.timestamps
    end
  end
end
