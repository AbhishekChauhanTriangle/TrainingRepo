class JoinController < ApplicationController
	before_filter :authenticate_user!
	layout 'standard'	
	def index
		@products_join_category = Product.joins(:category)
		@products_not_joined_category_id = Product.select('id').where(category_id: nil)
		@products_not_joined_category_name = Product.select('name').where(category_id: nil)
		@products_not_joined_category_quantity = Product.select('quantity').where(category_id: nil)
	end


	# Use Join When you dont need to access the association;s attributes
end
