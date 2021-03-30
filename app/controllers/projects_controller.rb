class ProjectsController < ApplicationController
    require 'pry'

    def index 
        @projects = Project.all
    end 

    def new 
        @project = Project.new
        @technologies = Technology.all
        3.times do 
            resource = @project.resources.build
            resource.build_technology
        end 
    end 

    def show 
        @project = Project.find(params[:id])
    end 

    def create 
        @project = Project.new(project_params)
        if @project.save
            redirect_to project_path(@project)
        else 
            # @technologies = Technology.all
            3.times do 
                resource = @project.resources.build
                resource.build_technology
            end 
            render :new
        end 
    end 

    private 
    def project_params
        params.require(:project).permit(:title, :description, :number_of_developers, technology_ids:[], resources_attributes:[:url, technology_attributes:[:name]])
    end
end
