class UserSubject < ActiveRecord::Base
  attr_accessible :subject_id, :user_id
  belongs_to :user
end
