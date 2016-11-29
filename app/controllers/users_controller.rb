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
    show_networth_chart(@user)
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

  def block
    @user = User.find(params[:id])

    opposite = !@user.block
    if @user.update_attribute(:block, opposite)

      if (@user.block)
        flash[:success] = "#{@user.name} has been blocked"

      else
        flash[:success] = "#{@user.name} has been unblocked"
      end
      redirect_to users_url
    else
      redirect_to @user
    end
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

  def show_networth_chart(user)

    networth_data = []
    historic_data = user.user_historic_data
    historic_data.each do |data|

        networth_float = data.net_worth.truncate(2).to_f()

        # Multiply 1000 because Javascript DateTimes are in milliseconds
        data_node = [data.created_at.to_i * 1000, networth_float]
        networth_data.push(data_node)

        # Create extra data point if the entry has been updated.
        # It means the net worth has not changed during that time.
        if data.created_at != data.updated_at
            data_node = [data.updated_at.to_i * 1000, networth_float]
            networth_data.push(data_node)
        end
    end

    @chart = LazyHighCharts::HighChart.new('graph') do |f|

      f.title(text: "Progress Report")
      f.options[:xAxis] = {
          type: 'datetime',
          dateTimeLabelFormats: {
            month: '%b. %e'
          },
          title: {
            text: 'Date'
          },
          minTickInterval: (24 * 3600 * 1000)
      }

      f.yAxis [
        { title: { text: "Net Worth ($)" }, margin: 70 },
      ]

      f.series(name: "Net Worth", data: networth_data)

      # f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "line"})
    end

    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.chart(
        backgroundColor: {
          linearGradient: [0, 0, 500, 500],
          stops: [
            [0, "rgb(255, 255, 255)"],
            [1, "rgb(240, 240, 255)"]
          ]
        },
        borderWidth: 2,
        plotBackgroundColor: "rgba(255, 255, 255, .9)",
        plotShadow: true,
        plotBorderWidth: 1
      )
      f.lang(thousandsSep: ",")
      f.colors(["#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
    end

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
