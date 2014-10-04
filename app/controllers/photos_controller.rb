class PhotosController < ApplicationController
  load_and_authorize_resource :album
  load_and_authorize_resource :photo, through: :album

  def show
    redirect_to edit_album_photo_path
  end

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

  private

  def photo_params
    params.require(:photo).permit(:image, :album_id)
  end
end
