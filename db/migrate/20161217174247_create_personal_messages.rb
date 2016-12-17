class CreatePersonalMessages < ActiveRecord::Migration[5.0]
	def change
		create_table :personal_messages do |t|
			t.text :body
			
			t.references :conversation
			t.references :user

			t.timestamps
		end
	end
end
