class IdeasController < ApplicationController

	def index
		@ideas = current_user.ideas
	end

	def new
	end

end