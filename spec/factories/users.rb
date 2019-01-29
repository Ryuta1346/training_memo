FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "Test User#{n}"}
    sequence(:email) {|n| "test#{n}@example.com"}
    password {"password"}
    started_at {2019-01-01}
    finished_at {2019-03-31}
    aim {65.0}
    weight {75.0}
    height {1.7}
  end
end
