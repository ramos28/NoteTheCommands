class CreateMenuProducts < ActiveRecord::Migration[5.0]
  	def change
  		create_join_table :menu, :product do |t|
			t.index :product_id
			t.index :menu_id

			t.integer :category, null: false
			t.integer :quantity, null: false

			t.timestamps
		end
  	end
end
