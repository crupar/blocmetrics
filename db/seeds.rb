require 'faker'


User.destroy_all
RegisteredApplication.destroy_all
Event.destroy_all

10.times do
    User.create!(
      username: Faker::Internet.user_name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(6),
      role: standard
  )
end
users = User.all


25.times do
  RegisteredApplication.create!(
    name:  Faker::App.name,
    url:   Faker::Internet.url,
    user:  users.sample
  )
end
registered_application = RegisteredApplication.all

20.times do
  Event.create!(
    name: Faker::Lorem.word
  )
end



User.create!(
  username: "carolyn",
  email: "carolyntestingcode@gmail.com",
  password: "helloworld",
)

User.create!(
  username: "admin",
  email: "admin@blocmetrics.com",
  password: "helloworld",
)




puts "Seed finished"
puts "#{RegisteredApplication.count} applications created"
puts "#{User.count} users created"
