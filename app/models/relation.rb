class Relation < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :artist
end
