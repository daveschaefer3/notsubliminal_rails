require 'spec_helper'

describe "Artist Pages" do
  
  subject { page }

  describe "new artist page" do
    before { visit new_artist_path }

    it { should have_content('Add an Artist') }
    it { should have_title(full_title('Add Artist')) }
  end
end
