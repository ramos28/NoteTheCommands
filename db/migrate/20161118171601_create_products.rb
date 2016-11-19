class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :product_type, null: false
      t.string :product_description
      t.float :unit_price, null: false

      t.timestamps null: false
    end
  end
end
