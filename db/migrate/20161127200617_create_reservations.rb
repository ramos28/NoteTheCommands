class CreateReservations < ActiveRecord::Migration[5.0]
	def change
	    create_table :reservations do |t|
	    	t.string :name, null: false
			t.integer :num_persons, null: false
			t.date :date, null: false
			t.time :hour, null: false
			t.integer :phone

			t.references :restaurant, null: false
			t.references :user

			#Aqui hay que añadir un menu que este o no creado por el cliente con el gerente del restaurante
			t.references :menu

			t.timestamps
	    end
	end
end
