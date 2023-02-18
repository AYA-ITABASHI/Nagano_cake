class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment
      t.integer :shipping_fee
      t.integer :amount_billed
      t.string :delivery_postal_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :order_status
      
      t.timestamps
    end
  end
end
