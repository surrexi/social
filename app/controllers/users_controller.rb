class UsersController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  def index
    @search = User.search(params[:q])
    @users = @search.result
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
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
