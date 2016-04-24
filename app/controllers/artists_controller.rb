class ArtistsController < ApplicationController
  before_action :authenticate!

  def index
    @artist = current_artist
    @profile = current_artist.artists_profile
    @art = Artwork.all
  end
end
