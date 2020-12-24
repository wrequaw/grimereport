class PasswordsController < ApplicationController
    def new
      # Nothing needed here because all your #new view needs is a password field
    end
  
    def create
      
      unless params[:password].present?
        return redirect_back(fallback_location: root_path, alert: 'Password is required.')
      end
      
      puts "params[:password]['password'] = #{params[:password]}"
      puts "Rails.configuration.visitor_password = #{Rails.configuration.visitor_password}"
      if params[:password]['password']== Rails.configuration.visitor_password
        cookies[:visitor_password_verified] = true
        redirect_to(root_path, notice: 'Password verified.')
        # redirect_to flash[:previous_page]
        
      else
        cookies.delete(:visitor_password_verified)
        redirect_back(fallback_location: root_path, alert: "You've entered the wrong password.")
        # redirect_to root_path, alert:"incorrect password"
        
      end
    end
  end