class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    omauth
  end

  def omauth
    @user = User.find_for_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: "#{action_name}".capitalize) if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end
end
