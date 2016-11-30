class CreateCommandProducts < ActiveRecord::Migration[5.0]
  def change
	create_join_table :command, :product do |t|
		t.index :product_id
		t.index :command_id
		
		t.timestamps
    end
  end
end
