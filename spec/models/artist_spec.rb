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
end
