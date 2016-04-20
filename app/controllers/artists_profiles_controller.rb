# class ArtistsProfilesController < ApplicationController
#   before_filter
#   def show
#   @profile = Profile.find(params[:id])
#   end
#
#   def update
#     respond_to do |format|
#       if @profile.update(profile_params)
#         format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
#       else
#         format.html { render :edit }
#       end
#     end
#   end
#
#   private
#
#   def find_profile
#     @profile = Profile.find(params[:id])
#   end
#
#   def profile_params
#     params.require(:profile).permit(:bio, :avatar)
#   end
# end
