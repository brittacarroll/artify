class Gallery < ActiveRecord::Base
  acts_as_messageable

  has_many :relations
  has_many :artists, through: :relations
  has_one :gallery_profile, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :representative_name, presence: true

  after_create :build_default_profile

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  private

  def build_default_profile
    @profile = GalleryProfile.new(gallery_id: id)
    @profile.save
    true
  end
end
