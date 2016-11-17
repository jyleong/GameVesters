class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    ## pull user out of db
    if @user && @user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    	log_in @user

      if logged_in? && been_24_hours?(@user.last_login)
        gib_daily_bonus
        @user.update_attribute(:last_login, Time.now)
        flash[:success] = "You have obtained $20,000 for daily login bonus!"
      end
      ## step to remember if checked

		params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
    	redirect_back_or @user
    else
      # Create an error message.
      flash.now[:danger] = "Invalid user or password combination"
      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end

  private
  def been_24_hours?(last_login_time)
    if last_login_time != nil
      ((Time.now - last_login_time) / 1.hour).round < 24
    else
      @user.update_attribute(:last_login, Time.now)
    end
  end

  def gib_daily_bonus
    current_amount = @user.currency
    if current_amount == nil
      current_amount = BigDecimal.new(0.0, 0)
    end
    reward_amount = BigDecimal.new(20000.00, 0)
    current_amount = current_amount + reward_amount
    @user.update_attribute(:currency, current_amount)
  end
end
