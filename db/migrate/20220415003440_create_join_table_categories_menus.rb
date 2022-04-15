class CreateJoinTableCategoriesMenus < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :menus do |t|
			t.index [:category_id, :menu_id]
      t.index [:menu_id, :category_id]
			# t.references :category, null: false, foreign_key: true
   #    t.references :menu, null: false, foreign_key: true
    end
  end
end
