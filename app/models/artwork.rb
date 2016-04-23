class Artwork < ActiveRecord::Base
  belongs_to :artist
  mount_uploader :art, ArtUploader

  validates :title, presence: true
  validates :artist, presence: true
end
