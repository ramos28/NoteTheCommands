class CreateQuestionnaires < ActiveRecord::Migration[5.0]
	def change
		create_table :questionnaires do |t|
			t.string :question, null: false

			t.references :restaurant

			## Rememberable
      		t.datetime :remember_created_at
			t.timestamps
		end
	end
end
