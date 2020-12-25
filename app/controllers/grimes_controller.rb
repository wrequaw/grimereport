class GrimesController < ApplicationController
  before_action :require_password_verification
  before_action :require_login, only: [:new]
  def index
      @grimes = Grime.all 
  end

  def show
      @grime = Grime.find(params[:id])
  end

  def new
      @grime = Grime.new
  end

  def create
      @grime = Grime.new(grime_params)
      
      
      if @grime.save
          flash[:success] = "Grime Saved Successfully"
          redirect_to @grime
      else
          flash[:error] = "Error: Could Not Save Grime!"
          render :new
      end
  end

  def edit
      @grime = Grime.find(params[:id])
  end

  def update
      @grime = Grime.update(grime_params)
      if @grime.save
          flash[:success] = "Grime Saved Successfully"
          redirect_to @grime
      else
          flash[:error] = "Error: Could Not Update Grime!"
          render :edit
      end
  end

  def destroy
      Grime.find(params[:id]).destroy
  end

    

  
  private
  
      def require_login
        if session[:user_id].nil?
            redirect_back(fallback_location: root_path, alert: "You must be logged in to create a grime!")
        end
      end
      
      def grime_params
          params.require(:grime).permit(:title, :description, :griminess,:user_id)
      end  
end
