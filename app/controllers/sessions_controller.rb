class SessionsController < ApplicationController
    #logging a user, logging a user in, omniauth
    
        def omniauth
            user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
            end
    
            if user.valid?
                session[:user_id] = user.id
                redirect_to root_path
            else
                flash[:message] = user.errors.full_messages.join(", ")
                redirect_to root_path
            end
    
        end
    
        private
    
        def auth
            request.env['omniauth.auth']
        end
    end
    