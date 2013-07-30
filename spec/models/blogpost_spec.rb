require 'spec_helper'

describe Blogpost do
  let(:user) { FactoryGirl.create(:user) }
  before { @blogpost = user.blogposts.build(content: "Lorem Ipsum") }

  subject { @blogpost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @blogpost.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @blogpost.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too short" do
    before { @blogpost.content = "Foo" }
    it { should_not be_valid }
  end
end # Blogpost
