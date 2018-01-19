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

10.times do |n|
  Film.create!(name: "Fim #{n}",
               play_time: 240,
               link_trailer: '<iframe width="560" height="315" src="https://www.youtube.com/embed/Q0CbN8sfihY" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>',
               image: open("https://resizing.flixster.com/eQ8z-h3mtqUCASBMi7empUwNFdU=/206x305/v1.bTsxMjU0NjIzNDtqOzE3NTYwOzEyMDA7MTY4ODsyNTAw"),
               imdb_rate: 3.5,
               describe: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
               status: "1",
               categories_attributes: [
                 {content: "234"},
                 {content: "567"}
               ],
               watching_days_attributes: [
                 {day_watching: "2017-12-27",
                    watching_times_attributes:[
                      {time: "8:00 AM",
                       total_ticket: 125,
                       price: 80000000},
                      {time: "10:00 AM",
                       total_ticket: 125,
                       price: 80000000},
                      {time: "12:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "01:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "03:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "05:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "07:00 PM",
                       total_ticket: 125,
                       price: 90000000},
                      {time: "09:00 PM",
                       total_ticket: 125,
                       price: 90000000}
                    ]
                  },
                  {day_watching: "2017-12-28",
                    watching_times_attributes:[
                      {time: "8:00 AM",
                       total_ticket: 125,
                       price: 80000000},
                      {time: "10:00 AM",
                       total_ticket: 125,
                       price: 80000000},
                      {time: "12:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "01:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "03:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "05:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "07:00 PM",
                       total_ticket: 125,
                       price: 90000000},
                      {time: "09:00 PM",
                       total_ticket: 125,
                       price: 90000000}
                    ]
                  },
                  {day_watching: "2017-12-29",
                    watching_times_attributes:[
                      {time: "8:00 AM",
                       total_ticket: 125,
                       price: 80000000},
                      {time: "10:00 AM",
                       total_ticket: 125,
                       price: 80000000},
                      {time: "12:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "01:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "03:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "05:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "07:00 PM",
                       total_ticket: 125,
                       price: 90000000},
                      {time: "09:00 PM",
                       total_ticket: 125,
                       price: 90000000}
                    ]
                  },
                  {day_watching: "2017-12-30",
                    watching_times_attributes:[
                      {time: "8:00 AM",
                       total_ticket: 125,
                       price: 80000000},
                      {time: "10:00 AM",
                       total_ticket: 125,
                       price: 80000000},
                      {time: "12:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "01:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "03:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "05:00 PM",
                       total_ticket: 125,
                       price: 70000000},
                      {time: "07:00 PM",
                       total_ticket: 125,
                       price: 90000000},
                      {time: "09:00 PM",
                       total_ticket: 125,
                       price: 90000000}
                    ]
                  }
               ]
              )
end

15.times do |n|
  m = n+2
  Rating.create!(film_id: 1, user_id: "#{m}", mark: "8", review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
  Rating.create!(film_id: 2, user_id: "#{m}", mark: "8", review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
end


  PostReview.create!(user_id: 1, title: "Avg 1", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", approve: true)

