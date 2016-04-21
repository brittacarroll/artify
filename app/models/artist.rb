class Artist < ActiveRecord::Base
  has_many :relations
  has_many :galleries, through: :relations
  has_one :artists_profile, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ARTISTS = [
    "painter",
    "sculptor",
    "photographer",
    "architect"
  ]


  after_create :build_default_profile

  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def build_default_profile
    binding.pry
    @profile = ArtistsProfile.new(artist_id: id)
    @profile.save
    true
  end
end
