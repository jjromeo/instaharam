class ProfileController < Devise::RegistrationsController 

  def show
    @disable_separator = true
    @user = User.find(params[:id])
  end
end
