class AddAdressToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :adress, :string
  end
end
