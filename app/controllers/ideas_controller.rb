class IdeasController < ApplicationController

	def index
		@ideas = current_user.ideas
	end

	def new
		@idea = current_user.ideas.new
	end

	def create
	end

end