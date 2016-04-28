class AddColumnGalleries < ActiveRecord::Migration
  def up
    add_column :galleries, :description, :text
  end

  def down
    remove_column :galleries, :description
  end
end
