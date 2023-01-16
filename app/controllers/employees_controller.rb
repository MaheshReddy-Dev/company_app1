class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
   @employees = Employee.all
  end


  def show
  end

  def edit
  end


  def new
    @employee = Employee.new
  end


  def create
    @employee = Employee.new(employee_params)
     if @employee.save
       redirect_to @employee
       flash[:notice] =  "Employee was successfully created."
     else
      render 'new' , status: :unprocessable_entity
     end
  end


 def update
   # @employee= Employee.find(params[:id])
   #@employee.project = Project.find(params[:employee][:company_id])
   if @employee.update(employee_params)
     redirect_to @employee
     flash[:notice] = "Employee was successfully updated."
    else
    render 'edit', status: :unprocessable_entity
   end
 end



  def destroy
    @employee.destroy
    flash[:notice] = "Employee fired successfully"
    redirect_to employees_path
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :company_id,:gender,:email, :phonenumber,:salary,:experience)
    end
end
