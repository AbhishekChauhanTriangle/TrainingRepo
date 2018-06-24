class Product < ActiveRecord::Base
   attr_accessible :id, :name, :quantity, :category_id
   belongs_to :category
end
