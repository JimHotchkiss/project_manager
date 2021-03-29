module SessionsHelper


    def login(user)
        session[:user_id] = user.id
        flash[:message] = "You are signed in."
    end

end
