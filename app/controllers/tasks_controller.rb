class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
   @tasks = Task.all
  end


  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    @projects = Project.all
  end


  def new
    @task = Task.new
    #@Projects = Project.all
  end


  def create
    @task = Task.new(task_params)
     if @task.save
       redirect_to @task
       flash[:notice] =  "task was successfully created."
     else
      render 'new' , status: :unprocessable_entity
end
end


 def update
  # @task = Task.find(params[:id])
   #@task.project = Project.find(params[:task][:project_id])
   if @task.update(task_params)
     redirect_to @task,
     flash[:notice] = "task was successfully updated."
    else
    render 'edit', status: :unprocessable_entity
   end
 end



  def destroy
    @project.destroy
    flash[:notice] = "project deleted successfully"
    redirect_to tasks_path
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :project_id, :description)
    end
end
