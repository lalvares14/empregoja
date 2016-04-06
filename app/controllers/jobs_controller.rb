class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    job = Job.new(params.require(:job).permit(:title,:category,:location,:description,:company))
    job.save
    redirect_to job
  end
end
