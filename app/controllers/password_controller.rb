class PasswordController < ApplicationController
    def new
      # Nothing needed here because all your #new view needs is a password field
    end
  
    def create
      unless params[:password].present?
        return redirect_back(fallback_location: root_path, alert: 'Password is required.')
      end
  
      if params[:password] == Rails.configuration.visitor_password
        cookies[:visitor_password_verified] = true
        redirect_to(root_path, notice: 'Password verified.')
      else
        cookies.delete(:visitor_password_verified)
        redirect_back(fallback_location: root_path, alert: 'You've entered the wrong password.')
      end
    end
  end