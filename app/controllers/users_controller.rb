class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    3.times { @user.subscriptions.build }
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      log_in(@user.name, @user.password)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
