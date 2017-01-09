class CreateProducts < ActiveRecord::Migration[5.0]
    def change
        create_table :products do |t|
            t.string :name, null: false
            t.integer :type_product, null: false
            t.text :ingredients
            t.text :preparation
            t.float :price, null: false

            t.boolean :younger, null: false

            t.references :restaurant

            t.timestamps
        end
    end
end
