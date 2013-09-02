class Album < ActiveRecord::Base
  has_many :albumArtistRelationships
  has_many :artists, through: :albumArtistRelationships
  validates :name, presence: true, length: { maximum: 100 }
end
