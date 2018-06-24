class IncludeController < ApplicationController
	
	before_filter :authenticate_user!
	layout 'standard'	

	def index
		# Includes decides whether to use EAGER_LOAD or PRELOAD to fetch data. 
		# Use Includes when you do need to access the association's attributes
		# Decides on Conditions such as - 

		#@eager_load = User.includes(:addresses).where("addresses.country = ?", "Poland")

		@eager_load = User.eager_load(:addresses).where("addresses.country = ?", "Poland")

		# Rails detected that the condition in where clause is using columns from 
		# preloaded (included) table names. So #includes delegates the job to #eager_load.

		# User.preload(:addresses).where("addresses.country = ?", "Poland")
		# Above statement will give Exception, because we haven’t joined users table with addresses table in any way.


		@include_no_good = User.joins(:addresses).where("addresses.country = ?", "Poland").includes(:addresses)

		@preload_good = User.joins(:addresses).where("addresses.country = ?", "Poland").preload(:addresses)
	end
end
