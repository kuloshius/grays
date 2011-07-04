class SessionsController < ApplicationController
  skip_before_filter :authenticate, :only => [:new, :create]

  def new
    @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to user, :notice => "Logged in!"
    else
      @title = "Sign in"
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
