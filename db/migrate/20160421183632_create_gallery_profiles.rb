class CreateGalleryProfiles < ActiveRecord::Migration
  def change
    create_table :gallery_profiles do |t|
      t.belongs_to :gallery
      t.text :description
      t.string :avatar

      t.timestamps null: false
    end
  end
end
