class CreateContacts < ActiveRecord::Migration
  def change
  	  	create_table :contacts do |t|
  		t.text :mail
  		t.text :message

  		t.timestamps null: true
  	end
  end
end
