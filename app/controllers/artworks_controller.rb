class ArtworksController < ApplicationController
  respond_to :html

  def index
    @artist = current_artist
    @profile = current_artist.artists_profile
  end

  def new
    @artwork = Artwork.new
    @artist = Artist.find(params[:artist_id])
    @profile = current_artist.artists_profile
  end

  def create
    @profile = current_artist
    @artwork = Artwork.new(artwork_params)
    @artist = @artwork.artist
    @profile = current_artist.artists_profile

    respond_to do |format|
      if @artwork.save
        format.html { redirect_to artists_path,
          notice: 'Upload was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # def destroy
  #   binding.pry
  #   @artist = Artist.find(params[:artist_id])
  #   @artwork = Artwork.find(params[:id])
  #   @artwork.destroy
  #   flash[:notice] = "Succesfully deleted artwork!"
  #   redirect_to artists_path
  # end

  private

  def artwork_params
    params.require(:artwork).permit(
      :art,
      :title,
      :description,
      ).merge(artist: Artist.find(params[:artist_id]))
  end
end
