class Artist < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ARTISTS = [
    "painter",
    "scuptor",
    "photographer",
    "architect"
  ]

  validates :first_name, presence: true
  validates :last_name, presence: true
end
