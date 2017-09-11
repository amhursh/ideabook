class BaseController < ApplicationController
	before_action :redirect?

	def logged_in?
		render file: '/public/404' unless current_user
	end

	def not_authorized
		current_user.id != params[:id].to_i 
	end

	def authorized
		render file: '/public/404' unless (current_user.id == params[:user_id].to_i)
	end

	def render_404
		render file: '/public/404'
	end

end