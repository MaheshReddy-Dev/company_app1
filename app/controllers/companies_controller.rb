class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  def index
    @companies = Company.all
    @company = Company.new
    puts @companies.inspect
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
       respond_to do |format|
         if @company.save
          format.html { redirect_to companies_path, notice: 'company was successfully Created.'}
          format.js   {}
        else
            format.html { render :index }
        end
     end
  end

 def update
    if @company.update(company_params)
       respond_to do |format|
       format.html { redirect_to @company, notice: 'company was successfully updated.' }
       format.js   {}#render inline: "company_reload();"}
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
   @company.destroy
     respond_to do |format|
      format.js { }
    end
  end


  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :state, :city, :website)
    end
end
