class CreateMenus < ActiveRecord::Migration[5.0]
	def change
		create_table :menus do |t|
			#Si es infantil , especial o diario
			t.integer :type_menu, null: false
			t.float :price, null: false

			t.references :restaurant, null: false
			t.references :user

			t.timestamps
		end
	end
end
