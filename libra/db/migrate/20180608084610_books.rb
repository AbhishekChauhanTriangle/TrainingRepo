class Books < ActiveRecord::Migration
  def self.up
  	create_table :books do |t|
  		t.column :subject_id, :integer, :null => false
  		t.column :title, :string, :limit => 32, :null => false
    	t.column :price, :float, :null => false
    	t.column :description, :text, :null => false
    	t.column :created_at, :timestamp, :null => false
    end
  end

  def self.down
  	drop_table :books
  end
end
