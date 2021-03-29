class DevelopersController < ApplicationController

    def new
        @developer = Developer.new
    end 

    def create
        @developer = Developer.new(developer_params)
        if @developer.save 
            session[:user_id] = @developer.id
            flash[:message] = "You are signed in."
            redirect_to projects_path
        else 
            render new
        end 
    end 

    private 

    def developer_params
        params.require(:developer).permit(:username, :email, :password, :password_confirmation)
    end
end
