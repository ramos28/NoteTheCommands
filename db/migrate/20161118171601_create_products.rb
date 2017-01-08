class CreateProducts < ActiveRecord::Migration[5.0]
    def change
        create_table :products do |t|
            t.string :name, null: false
            t.integer :type, null: false
            t.string :description
            t.float :price, null: false

            t.boolean :younger, default: true, null: false

            t.references :restaurant

            t.timestamps
        end
    end
end
