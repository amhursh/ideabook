class IdeasController < ApplicationController

	def index
		binding.pry
		@ideas = current_user.ideas
	end

end