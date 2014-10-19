namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Diego Garza",
                 email: "email@example.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    Event.create!(user_id: 1,
                  name: "HackTx",
                  description: "Hackaton at UT Austin",
                  longitude: -97.7364968, 
                  latitude: 30.2848502)
    99.times do |n|
      Post.create!(event_id: 1,
                   name: Faker::Name.first_name,
                   comment: Faker::Lorem.sentence,
                   score: Faker::Number.number(3))
    end
  end
end