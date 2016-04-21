class ArtistsController < ApplicationController
  before_action :authenticate!

  def index
    if artist_signed_in?
      @profile = current_artist.artists_profile
    end
    @artist = current_artist
  end
end
