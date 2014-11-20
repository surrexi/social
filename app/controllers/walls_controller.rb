class WallsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :wall

  def create
    @wall = @user.received.create(wall_params.merge(sender: current_user))
    redirect_to user_path(@user)
  end

  def update
  end

  def destroy
    @wall.destroy
    redirect_to user_path(@user)
  end

  private

  def wall_params
    params.require(:wall).permit(:body)
  end
end
