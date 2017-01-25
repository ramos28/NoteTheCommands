class CreateCommands < ActiveRecord::Migration[5.0]
	def change
		create_table :commands do |t|
			t.string :title, null: false

			t.integer :place, null: false
			t.references :restaurant_user, null: false
			t.references :restaurant, null: false

			t.text :description
			t.boolean :is_served, default: false, null: false
			t.boolean :is_end, default: false, null: false

			t.float :total_price_command, default: 0, null: false

			t.timestamps
		end
	end
end
