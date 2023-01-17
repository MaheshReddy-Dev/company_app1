class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

    def edit
     respond_to do |format|
       format.html
       format.js
     end
   end

  def create
    @company = Company.new(company_params)
     if @company.save
       respond_to do |format|
          format.html { redirect_to @company, notice: 'company was successfully Created.'}
          format.js   { render inline: "company_reload();"}
        end
        else
        render "new" , status: :unprocessable_entity
      end
    end
  #     render json: { message: "Company created successfully" }, status: :created
  #       #   flash[:notice] = "Company Created successfully"
  #        #redirect_to @company
  #     else
  #      render json: { errors: @company.errors } , status: :unprocessable_entity
  #   #   render 'new', status: :unprocessable_entity
  #    end
  # end

 def update
    if @company.update(company_params)
       respond_to do |format|
       format.html { redirect_to @company, notice: 'company was successfully updated.' }
       format.js { render inline: "company_reload();"}
     end
      #   flash[:notice] = "Company details updated successfully"
      #   redirect_to @company
     else
        render 'edit' , status: :unprocessable_entity
      end
 end

  def destroy
    @company.destroy
       render json: { message: "Company deleted successfully" }, status: :ok
    #  flash[:notice] = "Company destroyed successfully"
    #  redirect_to companies_path
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :state, :city, :website)
    end
end
