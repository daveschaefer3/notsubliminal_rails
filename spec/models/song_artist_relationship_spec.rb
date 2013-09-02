require 'spec_helper'

describe SongArtistRelationship do
  
  let(:artistSong) { FactoryGirl.create(:song) }
  let(:songArtist) { FactoryGirl.create(:artist) }
  let(:songArtistRelationship) { artistSong.songArtistRelationships.create(artist_id: songArtist.id) }

  subject { songArtistRelationship }

  it { should be_valid }

end
