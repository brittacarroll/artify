class ArtistsProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def show
    @profile = ArtistsProfile.find(params[:id])
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(artists_profile_params)
        binding.pry
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
    binding.pry
    @profile = current_artist
  end

  private

  def find_profile
    @profile = ArtistsProfile.find(params[:id])
  end

  def artists_profile_params
    params.require(:artists_profile).permit(:bio, :avatar)
  end
end
