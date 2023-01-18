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
          respond_to do |format|
           format.html { render :new , status: :unprocessable_entity}
           format.js
          # render 'new' , status: :unprocessable_entity
      end
      end
    end

 def update
    if @company.update(company_params)
       respond_to do |format|
       format.html { redirect_to @company, notice: 'company was successfully updated.' }
       format.js { render inline: "company_reload();"}
     end
      #   flash[:notice] = "Company details updated successfully"
      #   redirect_to @company
     else
       respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.js

      end
      #  render 'edit' , status: :unprocessable_entity
      end
 end

  def destroy
    respond_to do |format|
       @company.destroy
       format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
       format.js
     end
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
