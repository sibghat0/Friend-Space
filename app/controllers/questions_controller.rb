class QuestionsController < ApplicationController
  def check
    if current_user.answer1 == :answer1
        redirect_to home_path
    else
        # redirect_to profile_path
        puts 'error'
    end

  end

  
end
