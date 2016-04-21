class ArtistsProfile < ActiveRecord::Base
  belongs_to :artist
  mount_uploader :avatar, AvatarUploader
end
