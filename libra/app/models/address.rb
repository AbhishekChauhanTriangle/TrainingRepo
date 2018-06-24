class Address < ActiveRecord::Base
  attr_accessible :country, :city, :postal_code, :street
  belongs_to :user
end
