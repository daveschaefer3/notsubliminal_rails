FactoryGirl.define do
  factory :user do
    name    "Dave Schaefer"
    email   "test@test.com"
    password "foobar"
    password_confirmation "foobar"
  end
end