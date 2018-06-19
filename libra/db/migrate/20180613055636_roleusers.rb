class Roleusers < ActiveRecord::Migration
  def up
  	create_table :roleusers do |t|
  		t.references :users
  		t.references :roles
  	end
  end

  def down
  	drop_table :RoleUsers
  end
end
