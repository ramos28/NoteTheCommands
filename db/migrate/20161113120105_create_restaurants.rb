class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :email
      t.integer :phone
      t.string :country
      t.integer :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
