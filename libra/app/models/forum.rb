class Forum < ActiveRecord::Base
  attr_accessible :name, :public
  has_and_belongs_to_many :users	
end
