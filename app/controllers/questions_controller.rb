class QuestionsController < ApplicationController
  def check
    if current_user.answer1 == params[:answer1] && current_user.answer2 == params[:answer2]
        redirect_to home_path
    else
        # flash.now[:notice] = "Invalid Answer"
        puts 'error'
    end

  end

  
end
