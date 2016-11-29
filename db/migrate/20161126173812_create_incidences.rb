class CreateIncidences < ActiveRecord::Migration[5.0]
	def change
		create_table :incidences do |t|
			t.integer :category, null: false
			t.integer :priority, null: false
			t.string :title, null: false
			t.string :description, null: false
			t.boolean :is_solved, default: false, null: false

			t.datetime :date_start, null: false
			t.datetime :date_solution

			t.references :restaurant, null: false
			t.references :user, null: false

			t.timestamps
		end
	end
end
