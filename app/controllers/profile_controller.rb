class ProfileController < Devise::RegistrationsController 

    def show
        @user = User.find(params[:id])
    end
end
