require 'spec_helper'

describe Album do

  before { @album = Album.new(name: "Example Album",
    description: "This is an example description for Example Album") }

  subject { @album }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
end
