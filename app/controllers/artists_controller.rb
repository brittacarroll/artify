class ArtistsController < ApplicationController
  before_action :authenticate!

  def index
    if !current_artist.nil?
      @artist = current_artist
      @profile = current_artist.artists_profile
    end

    @art = Artwork.all

    if !current_gallery.nil?
      @art_piece = Artwork.find_by(params[:id])
      if @art_piece != nil
        @artist_profile = @art_piece.artist.artists_profile
      end
    end
  end
end
