class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])

      # If the user exists AND the password entered is correct.
      user = User.authenticate_with_credentials(params[:email], params[:password])

      #after the final check we assigning the user to the session
      session[:user_id] = user.id
      redirect_to '/'
    else
      #If user's login fails, send them back to the login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
