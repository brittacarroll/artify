class GalleryProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def show
    @profile = GalleryProfile.find(params[:id])
    @gallery = current_gallery
    @relations = @gallery.artists
    @artist_profile = ArtistsProfile.find_by(params[:artist_id])

    if params[:search]
      @artists = Artists.search(params[:search]).order("created_at DESC")
    else
      @artists = Artists.all.order('created_at DESC')
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(gallery_profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
    @profile = current_gallery
  end

  private

  def find_profile
    @profile = GalleryProfile.find(params[:id])
  end

  def gallery_profile_params
    params.require(:gallery_profile).permit(:bio, :avatar)
  end
end
