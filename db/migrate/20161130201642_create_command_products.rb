class CreateCommandProducts < ActiveRecord::Migration[5.0]
	def change
		create_join_table :command, :products do |t|
			t.primary_key :id
			t.index :product_id
			t.index :command_id

			t.integer :quantity, null: false
			t.boolean :is_served, default: false

			t.timestamps
		end
	end
end
