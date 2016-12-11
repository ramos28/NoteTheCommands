class CreateLocations < ActiveRecord::Migration[5.0]
  	def change
	    create_table :locations do |t|
			t.integer :place, null: false
			t.integer :sit, defaukt: 0, null: false
			t.float :total_price_command, default: 0, null: false

			t.references :restaurant, null: false
			t.references :user, null: false

			t.timestamps
	    end
	end
end
