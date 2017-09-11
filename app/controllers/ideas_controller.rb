class IdeasController < BaseController
	before_action :logged_in?
	before_action :authorized

	def index
		@ideas = Idea.where(user_id: params[:user_id])
	end

	def new
		@user = User.find(params[:user_id])
		@idea = current_user.ideas.new
		@categories = Category.all
	end

	def create
		idea = current_user.ideas.new(idea_params)
		if idea.save
			redirect_to user_idea_path(current_user, idea)
		else
			render :new
		end
	end

	def show
  		@idea = Idea.find(params[:id])
		@category = @idea.category
  		@user = User.find(params[:user_id])
	end

	def edit
		@idea = Idea.find(params[:id])
		@categories = Category.all
	end

	def update
		idea = current_user.ideas.find(params[:id])
		if idea.update(idea_params)
			redirect_to user_idea_path(current_user, idea)
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@idea = Idea.find(params[:id])
		@idea.destroy

		redirect_to user_ideas_path(@user)
	end

	private

	def idea_params
		params.require(:idea).permit(:title, :body, :category_id)
	end

end