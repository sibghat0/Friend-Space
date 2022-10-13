class TaskersController < ApplicationController
 
  def index
    @taskers = Tasker.all
  end

  def show
    @tasker = Tasker.find(params[:id])
  end

  def new
    @tasker = Tasker.new
  end

  def edit
  end

  def create
    @tasker = Tasker.new(tasker_params)
      if @tasker.save
         redirect_to tasker_url(@tasker)
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
