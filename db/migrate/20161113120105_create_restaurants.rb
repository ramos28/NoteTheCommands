class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :email, null:false
      t.integer :phone, null:false
      t.string :country, null: false
      t.integer :postal_code, null: false
      t.string :address, null: false
      t.string :name, null:false

      t.timestamps null: false
    end
    add_index :restaurants, :email,                unique: true
    add_index :restaurants, :name,                unique: true
  end
end
