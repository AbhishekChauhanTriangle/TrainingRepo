class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.integer :id
    	t.string  :name
    	t.integer :quantity
    	t.integer :category_id
      	t.timestamps
    end
  end
end
