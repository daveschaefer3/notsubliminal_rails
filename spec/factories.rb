FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@test.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
  
  factory :blogpost do
    title "foobar"
    content "Lorem Ipsum"
    user
  end

  factory :publishedBlogpost do
    title "foobar"
    content "Lorem Ipsum published"
    published true
    user
  end

  factory :song do
    title "test song"
    user_id 1
  end

  factory :album do
    name "test album"
    description "test description for test album"
  end

  factory :artist do
    name "test artist"
    description "test description for test artist"
    email "foobar@test.com"
    extlink "http://www.notsubliminal.com"
  end
end