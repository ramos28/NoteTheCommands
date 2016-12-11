class CreateTakeawayProducts < ActiveRecord::Migration[5.0]
	def change
		create_join_table :takeaway, :products do |t|
			t.index :takeaway_id
			t.index :product_id

			t.integer :quantity, null: false

			t.timestamps
		end
	end
end
