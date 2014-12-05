class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @search = User.search(params[:q])
    @users = @search.result
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:login, :first_name, :last_name, :birthday, :locale, :avatar, :remove_avatar)
  end
end
