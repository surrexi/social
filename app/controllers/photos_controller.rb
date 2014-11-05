class PhotosController < ApplicationController
  load_and_authorize_resource :album
  load_and_authorize_resource :photo, through: :album

  def create
    @photo = @album.photos.create!(photo_params.merge(user: current_user))
    redirect_to album_path(@album)
  end

  def update
    @photo.update(photo_params)
    redirect_to album_path(@album)
  end

  def destroy
    @photo.destroy
    redirect_to album_path(@album)
  end

  def vote
    if current_user.voted_for? @photo
      @photo.unliked_by current_user
    else
      @photo.liked_by current_user
    end
    respond_to do |format|
      format.json { render json: { count: @photo.get_likes.size } }
      format.html { redirect_to album_photo_path(@album, @photo) }
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :album_id)
  end
end
