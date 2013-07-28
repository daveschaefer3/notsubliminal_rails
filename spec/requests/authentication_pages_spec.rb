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
      it { should have_link('Users',       href: users_path) }
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

      describe "when visiting a protected page" do
        before do 
          visit edit_user_path(user)
          fill_in "Email",        with: user.email
          fill_in "Password",     with: user.password
          click_button "Sign In"
        end

        describe "after signing in" do
          it "should render the desired protected page" do
            expect(page).to have_title('Edit Profile')
          end
        end
      end # visiting a protected page

      describe "in the Users controller" do
        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title("Sign In") }
        end

        describe "submitting to the update action" do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe "visiting the user index" do
          before { visit users_path }
          it { should have_title('Sign In') }
        end
      end # in the Users controller
    end #for non-signed-in users

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@wrong.com") }
      before { sign_in user, no_capybara: true }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_title('Edit Profile') }
      end

      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_path) }
      end
    end # as a wrong user

    describe "as a non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin, no_capybara: true }

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { expect(response).to redirect_to(root_path) }
      end
    end # as a non-admin user
  end # authorization
end
