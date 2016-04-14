class CreateClients < ActiveRecord::Migration
  	def change
  		create_table :client do |t|
	  		t.text :name
	  		t.text :phone
	  		t.text :datestamp
	  		t.text :barber
	  		t.text :color

	  		t.timestamps# создаёт два столбца: created_at (дата создания сущности)
	  					# и updated_at (дата обновления сущности)
	end
end
