class AddIsDeletedToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_deleted, :boolean, default: "有効"
  end
end
