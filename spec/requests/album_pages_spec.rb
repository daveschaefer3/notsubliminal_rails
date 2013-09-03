require 'spec_helper'

describe "Album Pages" do
  
  subject { page }

  describe "new album page" do
    before { visit new_album_path }

    it { should have_content('Add an Album') }
    it { should have_title(full_title('Add Album')) }
  end
end
