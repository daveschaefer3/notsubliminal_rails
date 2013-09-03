class Album < ActiveRecord::Base
  has_many :albumArtistRelationships
  has_many :artists, through: :albumArtistRelationships
  has_many :albumSongRelationships
  has_many :songs, through: :albumSongRelationships
  validates :name, presence: true, length: { maximum: 100 }
end
