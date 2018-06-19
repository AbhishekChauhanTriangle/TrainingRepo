class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :role_id, null: :false
      t.string :role_type, null: :false

      t.timestamps
    end
  end
end
