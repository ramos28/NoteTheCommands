class CreateMessages < ActiveRecord::Migration[5.0]
	def change
		create_table :messages do |t|
			t.string :subject, null: false
			t.string :description, null: false
			t.boolean :is_view, default: false, null: false

			t.references :user, null: false
			t.references :user, null: false

			t.timestamps
		end
	end
end
