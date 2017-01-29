class CreateUserRestaurants < ActiveRecord::Migration[5.0]
	def change
		create_join_table :users, :restaurant do |t|
			t.index :user_id
			t.index :restaurant_id

			t.primary_key :id
			t.integer :rol

			t.timestamps
		end
	end
end