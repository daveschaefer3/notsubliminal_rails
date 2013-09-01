require 'spec_helper'

describe "Song Pages" do
  
  subject { page }

  describe "new song page" do
    before { visit newsong_path }

    it { should have_content('Add a song') }
    it { should have_title('Add Song') }
  end
end
