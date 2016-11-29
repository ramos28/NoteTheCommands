class CreateTakeaways < ActiveRecord::Migration[5.0]
  	def change
	    create_table :takeaways do |t|
			t.string :name, null: false
			t.date :date, null: false
			t.time :hour, null: false

			t.references :product, null: false
			t.references :restaurant, null: false
			
			t.integer :quantity, null: false
			t.float :total_price_selection

			t.timestamps
	    end
  	end
end
