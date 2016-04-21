class AddProfilePhotoToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :profile_photo, :string
  end
end
