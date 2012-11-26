namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(firstName: "Example",
                 lastName: "User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      firstName  = Faker::Name.name
      lastName  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(firstName: firstName,
                   lastName: lastName,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end