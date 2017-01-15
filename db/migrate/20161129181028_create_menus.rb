class CreateMenus < ActiveRecord::Migration[5.0]
	def change
		create_table :menus do |t|
			t.string :name, null: false
			#Si es infantil , especial o diario
			t.integer :type_menu, null: false
			t.float :price, null: false
			t.text :description, null: false

			t.boolean :is_available, null: false

			t.references :restaurant, null: false
			t.references :user

			t.timestamps
		end
	end
end
