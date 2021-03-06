class CreateVotings < ActiveRecord::Migration[5.0]
  	def change
	    create_table :votings do |t|
			t.integer :answer, null: false

			t.references :restaurant
			t.references :questionnaire

			## Rememberable
			t.datetime :remember_created_at

	      	t.timestamps
	    end
  	end
end
