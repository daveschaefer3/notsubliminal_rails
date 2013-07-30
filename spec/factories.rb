FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@test.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end

    factory :blogpost do
      content "Lorem Ipsum"
      user
    end
  end
end