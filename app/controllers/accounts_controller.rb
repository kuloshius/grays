class AccountsController < ApplicationController
  def index
    @accounts = Account.all(:order => 'name')
  end

  def show
    @account = Account.find(params[:id])
    @children = @account.children
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
    @account.save
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    flash[:success] = params
    @account = Account.find(params[:id])
    @account.update_attributes(params[:account])
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
  end

end
