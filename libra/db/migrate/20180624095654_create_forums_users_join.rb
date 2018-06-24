class CreateForumsUsersJoin < ActiveRecord::Migration
  def change
    create_table :forums_users do |t|
      	t.integer :forum_id
      	t.integer :user_id
    end
  end
end
