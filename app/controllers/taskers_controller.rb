class TaskersController < ApplicationController
 
  def index
    @taskers = Tasker.all
    # start_date = params.fetch(:start_date, Date.today).to_date
    # @taskers = Tasker.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def show
    @tasker = Tasker.find(params[:id])
  end

  def new
    @tasker = current_user.taskers.build
  end

  def edit
    @tasker = Tasker.find(params[:id])
  end

  def create
    @tasker = current_user.taskers.build(tasker_params)
      if @tasker.save
         redirect_to taskers_url(@tasker)
      else
         render :new, status: :unprocessable_entity 
    end
  end

  def update
    @tasker = Tasker.find(params[:id])
      if @tasker.update(tasker_params)
         redirect_to tasker_url(@tasker)
      else
         render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @tasker = Tasker.find(params[:id])
    @tasker.destroy
     redirect_to taskers_url
  end

  def click
  end

  private
    def tasker_params
      params.require(:tasker).permit(:title, :description, :start_time, :end_time)
    end
end
