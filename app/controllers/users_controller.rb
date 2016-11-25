class UsersController < ApplicationController
  before_action :logged_in_user ,only: [:index, :edit, :show,:destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def search
    @users = User.search(params[:search])
    if @users
      @users = current_user.except_current_user(@users)
      render partial: 'search'
    else
      render status: :not_found, nothing: true
    end
  end

  def new
    @user = User.new
  end

  def my_portfolio
    @owned_stocks = current_user.owned_stocks.select('*')
  end

  def index
    if params[:search]
      @users = User.search(params[:search]).order("name ASC")
    else
      @users = User.paginate(page: params[:page], :per_page => 10)
    end
  end

  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
    @user_notifications = @user.notifications
  end

  def create
    @user = User.new(user_params)
    if @user.save
    #handle succesful save ,login upon new signup

      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url

      # log_in @user

      # flash[:success] = "Welcome to the Investors app!"

      # redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Account successfully saved!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :currency, :password,
      :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
