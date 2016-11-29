class CreateCommands < ActiveRecord::Migration[5.0]
	def change
		create_table :commands do |t|
			t.string :title, null: false

			t.references :location, null: false
			t.references :menu, null: false
			t.references :producto, null: false

			t.string :description

			t.boolean :is_end, default: false, null: false

			t.timestamps
		end
	end
end
