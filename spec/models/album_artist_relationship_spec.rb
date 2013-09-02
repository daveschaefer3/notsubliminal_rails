require 'spec_helper'

describe AlbumArtistRelationship do

  let(:albumArtist) { FactoryGirl.create(:artist) }
  let(:artistAlbum) { FactoryGirl.create(:album) }
  let(:albumArtistRelationship) { artistAlbum.albumArtistRelationships.create(artist_id: albumArtist.id) }

  subject { albumArtistRelationship }

  it { should be_valid }

end
