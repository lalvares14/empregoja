class CompaniesController < ApplicationController

before_action :set_companies, only: [:new, :create]

  def new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      redirect_to @company
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name, :location, :mail, :phone)
  end

  def set_companies
    @company = Company.new
  end

end
