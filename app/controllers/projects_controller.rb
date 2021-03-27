class ProjectsController < ApplicationController
    require 'pry'

    def index 
        @projects = Project.all
    end 

    def new 
        @project = Project.new
        @technologies = Technology.all
        3.times{@project.technologies.build}
        @project.resources.build
    end 

    def show 
        @project = Project.find(params[:id])
    end 

    def create 
        @project = Project.new(project_params)
        @project.save
        redirect_to project_path(@project)
    end 

    private 
    def project_params
        params.require(:project).permit(:title, :description, :number_of_developers, technology_ids:[], technologies_attributes:['name'], resources_attributes:['url'])
      end
end
