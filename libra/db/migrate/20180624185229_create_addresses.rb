class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.string :country
    	t.string :city
    	t.string :postal_code
    	t.string :street
    	t.integer :user_id
      	t.timestamps
    end
  end
end
