class UsersController < ApplicationController
  def show
    @title = "SLP | Home"
    @user = current_user
    @company = Company.new
  end

end
