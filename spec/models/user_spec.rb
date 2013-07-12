require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "Example User", email: "user@example.com",
  	password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end

  describe "when password is not present" do
  	before do 
  		@user = User.new(name: "Example User", email: "example@notsubliminal.com",
  			password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid }
  end

  describe "when password confirmation doesn't match" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
  end
end
