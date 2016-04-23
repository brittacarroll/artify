class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.belongs_to :artist, null: false
      t.belongs_to :gallery
      t.string :art
      t.string :title, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
