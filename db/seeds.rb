User.create!(name:  "Nguyen Hai Yen",
             email: "mundyeu@gmail.com",
             password: "chathayvui",
             password_confirmation: "chathayvui",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "ABC",
             email: "checkadmin@gmail.com",
             password: "chathayvui",
             password_confirmation: "chathayvui",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
             
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

