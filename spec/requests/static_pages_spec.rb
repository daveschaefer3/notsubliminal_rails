require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    before { visit root_path }

    it "should have the content 'Not Subliminal'" do
      expect(page).to have_content('Not Subliminal')
    end

    it "should have the right title" do
      expect(page).to have_title("Not Subliminal")
    end

  end # Home Page

  describe "About Page" do
    before { visit about_path }

    it "should have the content 'About'" do
      expect(page).to have_content('About')
    end

    it "should have the right title" do
      expect(page).to have_title("Not Subliminal | About")
    end
  end

  describe "Contact Page" do
    before { visit contact_path }

    it "should have the content 'Contact'" do
      expect(page).to have_content('Contact')
    end

    it "should have the right title" do
      expect(page).to have_title("Not Subliminal | Contact")
    end
  end
end
