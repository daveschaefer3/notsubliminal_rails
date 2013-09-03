class Song < ActiveRecord::Base
  has_many :songArtistRelationships
  has_many :artists, through: :songArtistRelationships
  has_many :albumSongRelationships
  has_many :albums, through: :albumSongRelationships
  validates :title, presence: :true, length: { maximum: 100 }
end
