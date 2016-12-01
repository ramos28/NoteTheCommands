class CreateStocks < ActiveRecord::Migration[5.0]
    def change
        create_table :stocks do |t|
            t.integer :quantity, null: false
            t.text :description_stock
            t.float :price_buy_unity, null: false

            t.references :product, null: false

            t.timestamps
        end
    end
end
