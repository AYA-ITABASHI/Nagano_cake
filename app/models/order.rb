class Order < ApplicationRecord
enum payment: { credit_card: 0, transfer: 1}
enum order_status: {
  waiting_for_payment: 0,
  payment_confirm: 1,
  production: 2,
  shipping_preparation: 3,
  sent: 4
}

 belongs_to :customer
 has_many :cart_items
 has_many :order_details
 has_many :items, through: :order_details

 def subtotal
    item.with_tax_price * amount
 end
end

