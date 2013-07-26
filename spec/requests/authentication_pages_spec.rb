require 'spec_helper'

describe "Authentication" do
  
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign In') }
    it { should have_title('Sign In') }
  end # signin page

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign In" }

      it { should have_title('Sign In') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end # with invalid info

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should have_link('Sign Out',    href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }
      
      describe "followed by signout" do
        before { click_link "Sign Out" }
        it { should have_link('Sign In') }
      end
    end # with valid information
  end # signin

  describe "authorization" do
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "visiting the edit page" do
        before { visit edit_user_path(user) }
        it { should have_title("Sign In") }
      end

      describe "submitting to the update action" do
        before { patch user_path(user) }
        specify { expect(response).to redirect_to(signin_path) }
      end
    end #for non-signed-in users
  end # authorization
end
