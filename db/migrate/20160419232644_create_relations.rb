class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.belongs_to :artist, null: false
      t.belongs_to :gallery, null: false

      t.timestamps null: false
    end
  end
end
