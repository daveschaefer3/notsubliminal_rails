class Artist < ActiveRecord::Base
  has_many :songArtistRelationships
  has_many :songs, through: :songArtistRelationships
  has_many :albumArtistRelationships
  has_many :albums, through: :albumArtistRelationships
  validates :name, presence: true, length: { maximum: 80 }
  validates :email, presence: :true
end
