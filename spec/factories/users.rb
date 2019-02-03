FactoryBot.define do
  factory :user do
    sample_weight  = (70.00..85.00).step(2.00).to_a
    current_weight = sample_weight.sample

    sequence(:name) { |n| "test-user#{n}" }
    sequence(:email) { |n| "test-user#{n}@example.com" }
    password { "password" }
    password_confirmation { "password"}
    started_at { Date.today }
    finished_at { Date.today.next_month(3) }
    aim { 65.0 }
    weight { current_weight }
    height { 1.7 }
  end
end
