class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
		create_table :blogs do |t|
			t.string :title, null: false
			t.string :description, null: false
			t.boolean :is_closed, default: false, null: false

			t.references :restaurant, null: false
			t.references :user, null: false

			t.timestamps
		end
	end
end

