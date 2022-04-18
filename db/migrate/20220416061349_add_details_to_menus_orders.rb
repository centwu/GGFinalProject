class AddDetailsToMenusOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :menus_orders, :price, :float
    add_column :menus_orders, :quantity, :integer
    add_column :menus_orders, :sub_total, :float, default: 0
  end
end
