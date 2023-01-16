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
  end

  def create
    @company = Company.new(company_params)
     if @company.save
         flash[:notice] = "Company Created successfully"
         redirect_to @company
      else
         render 'new', status: :unprocessable_entity
     end
  end

  def update
    if @company.update(company_params)
         flash[:notice] = "Company details updated successfully"
         redirect_to @company
       else
         render 'edit' , status: :unprocessable_entity
      end
  end

  def destroy
    @company.destroy
      flash[:notice] = "Company destroyed successfully"
      redirect_to companies_path
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :state, :city, :website)
    end
end
