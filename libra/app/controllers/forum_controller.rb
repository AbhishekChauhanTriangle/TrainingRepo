class ForumController < ApplicationController
	
	before_filter :authenticate_user!
	layout 'standard'

	def index
		@forum = Forum.all
	end

	def assign
		@forum_id = params[:id]
		current_user.forums << Forum.find_by_id(@forum_id)
	end

	def viewAllForum
		authorize! :viewAllForum, Forum
		@forum = Forum.all
	end

	def viewUsers
		authorize! :viewUsers, Forum
		@forum_id = params[:id]
		@users = Forum.find_by_id(@forum_id).users
	end
end
