class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    ## pull user out of db
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    	log_in user
      ## step to remember if checked

		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    	redirect_back_or user
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
end
