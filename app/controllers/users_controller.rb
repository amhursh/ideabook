class UsersController < BaseController
  before_action :logged_in?, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    user = current_user
    # user = User.find(params[:id])
    # if current_user.default? && user.admin?
    #   not_admin
    # elsif current_user.id != params[:id].to_i
    #   not_user
    if not_authorized
      render_404
    else
      @user = user
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
