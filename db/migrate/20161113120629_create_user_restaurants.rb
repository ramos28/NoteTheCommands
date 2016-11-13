class CreateUserRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :restaurant do |t|
      t.index :user_id
      t.index :restaurant_id

      t.integer :user_type

      t.timestamps
    end
  end
end
