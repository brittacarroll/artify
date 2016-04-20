class Gallery < ActiveRecord::Base
  has_many :relations
  has_many :artists, through: :relations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :representative_name, presence: true
end
