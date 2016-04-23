class GalleriesController < ApplicationController
  before_action :authenticate!

  def index
    if gallery_signed_in?
      @profile = current_gallery.gallery_profile
    end
    @gallery = current_gallery
  end
end
