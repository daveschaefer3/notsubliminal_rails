require 'spec_helper'

describe SongArtistRelationship do
  
  let(:artistSong) { FactoryGirl.create(:song) }
  let(:songArtist) { FactoryGirl.create(:artist) }
  let(:songArtistRelationship) { song.songArtistRelationships.build(artist_id: songArtist.id) }

  subject { songArtistRelationship }

  it { should be_valid }

  describe ""
end
