class UsersController < BaseController
  skip_before_action :redirect?, except: :show
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
