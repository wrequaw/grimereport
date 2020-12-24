class UsersController < ApplicationController
  before_action :require_password_verification
  def index
    @users = User.all 
  end

  def show
      @user = User.find(params[:id])
      user.grimes.each do |g|
        
      end
  end

  def new
      User.new
  end

  def create
      @user = user.new(user_params)
      if @user.save
          flash[:success] = "User Saved Successfully"
          redirect_to @user
     else
         flash[:error] = "Error: Could Not Save User!"
         render :new
     end
 end

 def edit
     @user = User.find(params[:id])
 end

 def update
     @user = User.update(user_params)
     if @user.save
         flash[:success] = "User Saved Successfully"
         redirect_to @user
     else
         flash[:error] = "Error: Could Not Update User!"
         render :edit
     end
 end

 def destroy
     User.find(params[:id]).destroy
 end


 private

     def grime_params
         params.require(:user).permit(:name, :email, :griminess)
     end
end
