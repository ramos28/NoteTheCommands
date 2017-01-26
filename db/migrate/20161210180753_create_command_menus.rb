class CreateCommandMenus < ActiveRecord::Migration[5.0]
	def change
		create_join_table :command, :menus do |t|
			t.primary_key :id
			t.index :menu_id
			t.index :command_id

			t.integer :quantity, null: false
			t.boolean :is_served, default: false
			t.boolean :is_cooked, default: false

			t.timestamps
		end
	end
end
