FactoryBot.define do
  factory :user do
    sample_weight  = (70.00..85.00).step(2.00).to_a
    current_weight = sample_weight.sample

    sequence(:name) { |n| "Test User#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
    started_at { 2019 - 01 - 01 }
    finished_at { 2019 - 03 - 31 }
    aim { 65.0 }
    weight { current_weight }
    height { 1.7 }
  end
end
