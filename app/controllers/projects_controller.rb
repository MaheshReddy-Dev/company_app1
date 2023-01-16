class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
   @projects = Project.all
  end


  def show
  end

  def edit
  end


  def new
    @project = Project.new
    @employee = Employee.all
  end


  def create
    @project = Project.new(project_params)
  #  @project.employee_id = params[:employee_id]
     if @project.save
       redirect_to @project
       flash[:notice] =  "project was successfully created."
     else
      render 'new' , status: :unprocessable_entity
    end
  end


  def update
  # @project = Project.find(params[:id])
  #@project.employee = Employee.find(params[:project][:employee_id])
    if @project.update(project_params)
     redirect_to @project,
     flash[:notice] = "project was successfully updated."
     else
    render 'edit', status: :unprocessable_entity
    end
  end




  def destroy
    @project.destroy
    flash[:notice] = "project deleted successfully"
    redirect_to projects_path
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:employee_id, :title,  :description)
    end
end
