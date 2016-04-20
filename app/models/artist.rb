class Artist < ActiveRecord::Base
  has_many :relations
  has_many :galleries, through: :relations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ARTISTS = [
    "painter",
    "sculptor",
    "photographer",
    "architect"
  ]

  validates :first_name, presence: true
  validates :last_name, presence: true
end
