require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do

    it "should have the content 'Not Subliminal'" do
      visit '/static_pages/home'
      expect(page).to have_content('Not Subliminal')
    end

  end
end
