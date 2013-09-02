class Song < ActiveRecord::Base
  has_many :artists, through: :songArtistRelationships
  validates :title, presence: :true, length: { maximum: 100 }
end
