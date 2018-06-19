class Roleuser < ActiveRecord::Base
   attr_accessible :user_id, :roles_id
   belongs_to :user
   belongs_to :role
end
