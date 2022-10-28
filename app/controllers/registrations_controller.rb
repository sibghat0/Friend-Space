class RegistrationsController < Devise::RegistrationsController

    private
    
    def sign_up_params
        params.require(:user).permit(:email, :user_name, :password, :password_confirmation, :question1, :answer1, :question2, :answer2)
    end

    def account_update_params
        params.require(:user).permit(:email, :user_name, :password, :password_confirmation, :current_password, :question1, :answer1, :question2, :answer2)
    end
end