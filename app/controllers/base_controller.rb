class BaseController < ApplicationController

	def logged_in?
		render file: '/pulic/404' unless current_user
	end

end