require 'spec_helper'

describe Song do
  
  before { @song = Song.new(title: "Example Song", 
    user_id: 1) }

  subject { @song }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:songArtistRelationships) }

  describe "when title is not present" do
    before { @song.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @song.title = "a" * 101 }
    it { should_not be_valid }
  end
end
