class SessionsController < ApplicationController

    def new 
    end 

    def omniauth 
     user = Developer.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      # We can assign the user a password, if they are going through oauth
      u.password = SecureRandom.hex(16)
     end 
     if user.valid?
      login(user)
      redirect_to projects_path
     else 
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to login_path 
     end 
    end 

    def create
       @user = Developer.find_by(username: params[:user][:username])
       if @user && @user.authenticate(params[:user][:password])
        login(@user)
        redirect_to projects_path(@user)
       else 
        flash[:error] = "Sorry, login info was incorrect. Please try again."
        redirect_to login_path
       end 
    end

    def destroy
        session.delete :user_id
        flash[:message] = "You are logged out"
        redirect_to '/'
    end

     private 
    def auth 
      request.env['omniauth.auth']
    end 


    
    
end
