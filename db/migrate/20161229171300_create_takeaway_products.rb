class CreateTakeawayProducts < ActiveRecord::Migration[5.0]
	def change
		create_join_table :takeaway, :products do |t|
			t.primary_key :id
			t.index :product_id
			t.index :takeaway_id

			t.integer :quantity, default: 0, null: false

			t.timestamps
		end
  	end
end
