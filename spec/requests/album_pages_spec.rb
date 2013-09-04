require 'spec_helper'

describe "Album Pages" do
  
  subject { page }

  describe "new album page" do
    before { visit new_album_path }

    it { should have_content('Add an Album') }
    it { should have_title(full_title('Add Album')) }

    describe "add an album" do
      before { visit new_album_path }
      let(:submit) { "Add Album" }

      describe "with invalid info" do
        it "should not create an album" do
          expect { click_button submit }.not_to change(Album, :count)
        end

        describe "after submission" do
          before { click_button submit }

          it { should have_title(full_title('Add Album')) }
          it { should have_content('error') }
        end
      end # with invalid info

      describe "with valid info" do
        before do
          fill_in "Name",         with: "Example Album"
          fill_in "Description",  with: "Example Album Description"
        end

        it "should create an album" do
          expect { click_button submit }.to change(Album, :count).by(1)
        end

        describe "after saving the album" do
          before { click_button submit }

          it { should have_selector('div.alert.alert-success',
            text: 'Album added!') }
        end
      end
    end # add an album
  end # new album page

  describe "index page" do
    let (:user) { FactoryGirl.create(:user) }
    before (:each) do
      sign_in user
      visit albums_path
    end

    it { should have_title(full_title('Albums')) }
    it { should have_content('Not Subliminal Albums') }

    describe "pagination" do
      before(:all) { 35.times { FactoryGirl.create(:album) } }
      after(:all) { Album.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each album" do
        Album.paginate(page: 1).each do |album|
          expect(page).to have_selector('li', text: album.name)
        end
      end
    end # pagination
  end # index page

  describe "show album page" do
    let(:album) { FactoryGirl.create(:album) }

    before { visit album_path(album) }

    it { should have_content(album.name) }
    it { should have_title(full_title(album.name)) }
  end # show album page

  describe "edit" do
    let(:album) { FactoryGirl.create(:album) }
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_album_path(album)
    end

    describe "page" do
      it { should have_content("Edit Album") }
      it { should have_title(full_title('Edit Album')) }
    end

    describe "with invalid information" do
      before do
        fill_in "Name",   with: " "
        click_button "Save Changes"
      end

      it { should have_content('error') }
    end # with invalid information

    describe "with valid information" do
      let(:new_name) { "New Name" }
      let(:new_description) { "New description" }
      before do
        fill_in "Name",         with: new_name
        fill_in "Description",  with: new_description
        click_button "Save Changes"
      end

      it { should have_title(full_title(new_name)) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign Out', href: signout_path) }
      specify { expect(album.reload.name).to eq new_name }
      specify { expect(album.reload.description).to eq new_description }
    end # with valid information

  end # edit album page
end
