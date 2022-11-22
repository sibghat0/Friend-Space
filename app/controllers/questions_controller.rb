class QuestionsController < ApplicationController
  # after_action :questioncheck
  def check
    if current_user.answer1 == params[:answer1] && current_user.answer2 == params[:answer2]
        redirect_to home_path
    else if current_user.answer1 != params[:answer1] && params[:answer1] != nil || current_user.answer2 != params[:answer2] && params[:answer2] != nil 
      
      redirect_to questions_path, notice: "frtfvfh"
      puts 'errrrrrffffffffffffffffffffffffff'
      flash[:alert] = "Dekh"
    end
  end
end
  # private
  # def questioncheck 
  #   unless !@check
  #     flash[:error] = "deklo bhai"
  #     redirect_to home_path
      
  #   end
  # end
  
  
end
