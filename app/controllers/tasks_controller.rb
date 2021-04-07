class TasksController < ApplicationController


    def new 
     @task = Task.new(project_id: params[:project_id])
    end 

    def create 
        @task = Task.new(task_params)
        if @task.save
            @project = Project.find(@task.project_id)
            redirect_to project_path(@project)
        else 
            @task = Task.new(project_id: params[:project_id])
            render :new
        end 
    end 


    private 

    def task_params
        params.require(:task).permit(:title, :description, :project_id)
    end
end
