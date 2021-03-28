class DevelopersController < ApplicationController

    def new
        @developer = Developer.new
    end 

    def create
        @developer = Developer.new(developer_params)
        if @developer.save 
            redirect_to projects_path
        else 
            render new
        end 
    end 

    private 

    def developer_params
        binding.pry
        params.require(:developer).permit(:username, :email, :password)
    end
end
