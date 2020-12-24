class SessionsController < ApplicationController
    #logging a user, logging a user in, omniauth
    
        def create
            user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.griminess = 0
            end
    
            if user.valid?
                session[:user_id] = user.id
                cookies.encrypted[:current_user_id] = {value: user.id, expires: Time.now + 7.days}
                redirect_to root_path
            else
                flash[:message] = user.errors.full_messages.join(", ")
                redirect_to root_path
            end
    
        end


        def destroy
            cookies.encrypted[:current_user_id] = nil
            cookies.delete(:visitor_password_verified)
            session[:user_id] = nil
            redirect_to root_path
        end
    
        private
    
        def auth
            request.env['omniauth.auth']
        end
    end
    