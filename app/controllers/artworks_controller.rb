class ArtworksController < ApplicationController

  respond_to :html

  def index
    @artist = current_artist
    @profile = current_artist.artists_profile
    @art = Artwork.find(params[:id])
  end

  def new
    @artwork = Artwork.new
    @artist = Artist.find(params[:artist_id])
    @profile = current_artist.artists_profile
  end

  def create
    binding.pry
    @artwork = Artwork.new(artwork_params)
    @artist = @artwork.artist
    @profile = current_artist.artists_profile
    respond_to do |format|
      if @artwork.save
        format.html { redirect_to @profile, notice: 'Upload was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private


  def artwork_params
    params.require(:artwork).permit(
    :title,
    :description,
    :art
    ).merge(artist: Artist.find(params[:artist_id]))
  end
end
