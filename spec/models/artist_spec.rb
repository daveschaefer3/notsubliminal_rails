require 'spec_helper'

describe Artist do

  before { @artist = Artist.new(name: "Example Artist", 
    description: "This in an example description for Example Artist", 
    email: "exampleartist@test.com", 
    extlink: "http://www.notsubliminal.com") }

  subject { @artist }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:email) }
  it { should respond_to(:extlink) }
  it { should respond_to(:albums) }
  it { should respond_to(:songs) }

  describe "when name is not present" do
    before { @artist.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @artist.name = "a" * 81 }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @artist.email = " " }
    it { should_not be_valid }
  end
end
