require 'spec_helper'

describe Album do

  before { @album = Album.new(name: "Example Album",
    description: "This is an example description for Example Album") }

  subject { @album }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  describe "when name is not present" do
    before { @album.name = " " }
    it { should_not be_valid }
  end

  describe "when the name is too long" do
    before { @album.name = "a" * 101 }
    it { should_not be_valid }
  end
end
