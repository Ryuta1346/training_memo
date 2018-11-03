User.create!(name:                  "Example User",
             email:                 "example_user@example.com",
             password:              "example",
             password_confirmation: "example",
             started_at:            "2018-11-01",
             finished_at:           "2019-02-09",
             weight:                "80.0",
             height:                "1.80",
             aim:                   "65.0"
)

User.create!(name:                  "Tenshi",
             email:                 "tenshi@example.com",
             password:              "tenshi",
             password_confirmation: "tenshi",
             started_at:            "2018-11-03",
             finished_at:           "2019-02-11",
             weight:                "60.0",
             height:                "1.60",
             aim:                   "50.0"
)

User.create!(name:                  "Daimazin",
             email:                 "daimazin@example.com",
             password:              "daimazin",
             password_confirmation: "daimazin",
             started_at:            "2018-11-05",
             finished_at:           "2019-02-13",
             weight:                "90.0",
             height:                "1.80",
             aim:                   "75.0"
)


# #Post
# user1 = User.find_by(name: "Example user")
# 50.times do |n|
#   training     = Faker::Lorem.sentence(5)
#   weight       = "#{80.0 - n / 100}"
#   date         = "#{user1.started_at + n}"
#   user1 = user1.posts.create!(weight: weight, training: training, date: date)
# end
#
# user2 = User.find_by(name: "Tenshi")
# 50.times do |n|
#   training = Faker::Lorem.sentence(5)
#   weight   = "#{60.0 - n / 100}"
#   date     = "#{user2.started_at + n}"
#   user2 = user2.posts.create!(weight: weight, training: training, date: date)
# end
#
# user3 = User.find_by(name: "Daimazin")
# 50.times do |n|
#   training = Faker::Lorem.sentence(5)
#   weight   = "#{90.0 - n / 100}"
#   date     = "#{user3.started_at + n}"
#   user3 = user3.posts.create!(weight: weight, training: training, date: date)
# end