class RelationsController < ApplicationController
  def create
    @artist = Artist.find(params[:artists_profile_id])
    @new_relation_object = Relation.new(artist: @artist, gallery: current_gallery)
    if @new_relation_object.save
      flash[:notice] = "New artist added!"
      redirect_to gallery_profile_path(current_gallery)
    else
      render :show
    end
  end
end
