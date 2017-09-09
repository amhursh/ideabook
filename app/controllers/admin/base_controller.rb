class BaseController < ApplicationController

	def require_admin
		render file: '/pulic/404' unless current_admin?
	end

end