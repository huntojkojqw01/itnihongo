class SearchsController < ApplicationController
	def index		
		@results=PgSearch.multisearch(params[:searchs])
		respond_to do |format|
			format.html {render partial: 'search_results'}
		end
	end
end
