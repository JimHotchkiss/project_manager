class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    include SessionsHelper
    def logged_in?
        session[:user_id]
    end 

    def current_user
      @developer ||= Developer.find_by(id: session[:user_id])
    end
end
