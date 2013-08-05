require 'spec_helper'

describe "Blogpost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "blogpost creation" do
    before { visit newblogpost_path }

    describe "with invalid information" do

      it "should not create a blogpost" do
        expect { click_button("Create Post").not_to change(Blogpost, :count) }
      end

      describe "error messages" do
        before { click_button "Create Post" }
        it { should have_content('error') }
      end
    end # with invalid information

    describe "with valid information" do
      before do 
        fill_in 'blogpost_content', with: "Lorem Ipsum"
        fill_in 'blogpost_title', with: "Foobar"
      end

      it "should create a blogpost" do
        expect { click_button "Create Post" }.to change(Blogpost, :count).by(1)
      end
    end
  end # blogpost creation
end