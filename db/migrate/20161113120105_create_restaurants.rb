class CreateRestaurants < ActiveRecord::Migration[5.0]
    def change
        create_table :restaurants do |t|
            t.string :name, null:false
            t.integer :phone, null:false
            t.string :address, null: false
            t.string :city, null: false
            t.string :country, null: false
            t.integer :postal_code, null: false
            t.string :email, null:false
            t.string :opening_hours
            t.float :latitude
            t.float :longitude
            t.integer :tables
            t.boolean :fastfood

            t.timestamps null: false
        end
        add_index :restaurants, :email,                unique: true
        add_index :restaurants, :name,                unique: true
    end
end
