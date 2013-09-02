class Artist < ActiveRecord::Base
  has_many :songs, through: :songArtistRelationships
  validates :name, presence: true, length: { maximum: 80 }
  validates :email, presence: :true
end
