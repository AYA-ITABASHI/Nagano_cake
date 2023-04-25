class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :is_deleted, inclusion: { in: [true, false] }

 has_many :cart_items
 has_many :addresses
 has_many :orders
end
