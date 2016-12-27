class CreateMenuProducts < ActiveRecord::Migration[5.0]
  	def change
		create_join_table :menu, :products do |t|
			t.index :menu_id
			t.index :product_id

			t.integer :category, null: false

			t.timestamps
		end
  	end
end
