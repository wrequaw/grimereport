class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def show
      @user = User.find(params[:id])
  end

  def new
      User.new
  end

  def create
      @user = user.new(user_params)
      if @user.save
          flash[:success] = "Grime Saved Successfully"
          redirect_to @user
     else
         flash[:error] = "Error: Could Not Save Grime!"
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
