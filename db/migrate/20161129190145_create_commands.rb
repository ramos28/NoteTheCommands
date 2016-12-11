class CreateCommands < ActiveRecord::Migration[5.0]
	def change
		create_table :commands do |t|
			t.string :title, null: false

			t.references :location, null: false
			t.references :user, null: false

			t.text :description
			t.integer :is_end, default: false, null: false

			t.timestamps
		end
	end
end
