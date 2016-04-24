class Artwork < ActiveRecord::Base
  belongs_to :artist
  mount_uploader :art, ArtUploader

  validates :title, presence: true
  validates :artist_id, presence: true
end
