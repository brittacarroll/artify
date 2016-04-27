class Artist < ActiveRecord::Base
  acts_as_messageable

  has_many :relations
  has_many :galleries, through: :relations
  has_one :artists_profile, dependent: :destroy
  has_many :artworks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ARTISTS = [
    "painter",
    "sculptor",
    "photographer",
    "architect"
  ]

  after_create :build_default_profile

  def mailboxer_name
    self.first_name
  end

  def mailboxer_email(object)
    self.email
  end

  def mailboxer_email(current_artist)
    return "artist@mail.com"
  end

  def self.search(query)
    where("first_name like ?", "%#{query}%")
  end

  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def build_default_profile
    @profile = ArtistsProfile.new(artist_id: id)
    @profile.save
    true
  end
end
