namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "test@test.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@test.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end # 99.times

    users = User.all
    5.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.blogposts.create!(content: content) }
    end
  end # task populate: :environment
end # namespace :db