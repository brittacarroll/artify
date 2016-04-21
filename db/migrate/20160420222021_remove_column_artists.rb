class RemoveColumnArtists < ActiveRecord::Migration
  def up
    remove_column :artists, :profile_photo
  end

  def down
    add_column :artists, :profile_photo, :string
  end
end
