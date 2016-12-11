class CreateCommandMenus < ActiveRecord::Migration[5.0]
	def change
		create_join_table :command, :menus do |t|
			t.index :menu_id
			t.index :command_id

			t.integer :quantity, null: false

			t.timestamps
		end
	end
end
