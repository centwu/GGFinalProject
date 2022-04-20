class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.string :status, default: "new"
      t.float :total, default: 0

      t.timestamps
    end
  end
end
