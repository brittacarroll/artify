class Artist < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ARTISTS = [
    "painter",
    "scuptor",
    "photographer",
    "architect"
  ]
end
