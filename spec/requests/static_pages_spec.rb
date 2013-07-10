require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do

    it "should have the content 'Not Subliminal'" do
      visit '/static_pages/home'
      expect(page).to have_content('Not Subliminal')
    end

  end # Home Page

  describe "About Page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
  end

  describe "Contact Page" do
    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end
  end
end
