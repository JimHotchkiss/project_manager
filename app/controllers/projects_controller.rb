class ProjectsController < ApplicationController
    require 'pry'

    def index 
        if params[:developer_id]
            @projects = Developer.find(params[:developer_id]).projects
          else
            @projects = Project.all
          end
    end 

    def new 
        @project = Project.new
        @technologies = Technology.all
        resource = @project.resources.build
        resource.build_technology
     
    end 

    def show 
        @project = Project.find(params[:id])
    end 

    def create 
        @project = Project.new(project_params)
        @project.developer_id = current_user.id
        if @project.save
            redirect_to project_path(@project)
        else 
            @technologies = Technology.all
            resource = @project.resources.build
            resource.build_technology
            render :new
        end 
    end 

    def edit 
        @project = Project.find(params[:id])
        resource = @project.resources.build
        resource.build_technology
    
    end 

    def update 
        @project = Project.find(params[:id])
        if @project.update(project_params)
            redirect_to project_path(@project)
        else 
            render :new
        end 
    end 

    def destroy 
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path

    end 

    private 
    def project_params
        params.require(:project).permit(:title, :description, :number_of_developers, technology_ids:[], resources_attributes:[:url, technology_attributes:[:name]])
    end
end
