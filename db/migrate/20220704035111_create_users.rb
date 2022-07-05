class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_first_name ,null:false 
      t.string :user_last_name, null:false 
      t.string :user_email,null:false,index:true 
      t.string :user_mobile,null:false,index:true
      t.text :user_address,null:false 
      t.timestamps
    end
  end
end
