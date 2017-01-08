class CreateEmails < ActiveRecord::Migration[5.0]
	def change
		create_table :emails do |t|
			t.string :subject, null: false
			t.text :description, null: false
			t.integer :is_view, default: false, null: false
			t.integer :is_sent, default: false, null: false
			t.string :user_for, null: false

			t.string :user_from, null: false

			t.timestamps
		end
	end
end
