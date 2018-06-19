class Roles < ActiveRecord::Base
  attr_accessible :role_id, :role_type

  has_many :users, through: :roleusers 
  has_many :roleusers
  # 1 - Admin
  # 2 - Student
  # 3 - Teacher
end
