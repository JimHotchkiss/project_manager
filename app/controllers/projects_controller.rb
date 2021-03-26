class ProjectsController < ApplicationController
    require 'pry'

    def index 
        @projects = Project.all
    end 

    def new 
        @project = Project.new
        @project.technologies.build
        3.times{@project.technologies.build}
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
        params.require(:project).permit(:title, :description, :number_of_developers, technology_ids:[], technologies_attributes: [:name])
      end
end
