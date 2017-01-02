class CreateTakeaways < ActiveRecord::Migration[5.0]
  	def change
	    create_table :takeaways do |t|
			t.string :name, null: false
			t.date :date, null: false
			t.time :hour, null: false
			t.integer :phone
			t.float :discount, default: 0, null: false
			t.integer :is_delivered, default: 0, null: false
			t.float :total_price_selection

			t.references :restaurant, null: false
			t.references :user

			t.timestamps
	    end
  	end
end
