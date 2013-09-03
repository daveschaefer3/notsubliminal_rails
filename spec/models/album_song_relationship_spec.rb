require 'spec_helper'

describe AlbumSongRelationship do

  let(:albumSong) { FactoryGirl.create(:song) }
  let(:songAlbum) { FactoryGirl.create(:album) }
  let(:albumSongRelationship) { songAlbum.albumSongRelationships.build(song_id: albumSong.id) }

  subject { albumSongRelationship }

  it { should be_valid }

end