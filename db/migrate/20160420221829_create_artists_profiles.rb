class CreateArtistsProfiles < ActiveRecord::Migration
  def change
    create_table :artists_profiles do |t|
      t.belongs_to :artist
      t.string "bio"
      t.string "avatar"

      t.timestamps null: false
    end
  end
end
