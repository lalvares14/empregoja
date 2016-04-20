class ContractsController < ApplicationController
  def show
    @contract = Contract.find(params[:id])
  end

  def new
  end

  def create
  end
end
