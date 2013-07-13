require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign Up') }
    it { should have_title(full_title('Sign Up')) }
  end # signup page

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid info" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid info" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end # signup

end
