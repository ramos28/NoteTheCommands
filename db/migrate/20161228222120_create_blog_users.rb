class CreateBlogUsers < ActiveRecord::Migration[5.0]
	def change
		create_table :blog_users do |t|
			t.references :user
			t.references :blog

			t.text :description

			t.timestamps
		end
	end
end
