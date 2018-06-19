class SearchController < ApplicationController
	before_filter :authenticate_user!
	layout 'standard'
	

	def search
	    if params[:term].nil?
	      @articles = Book.all
	    else
	      @articles = Book.es_search params[:term]
	    end
  end	
end
