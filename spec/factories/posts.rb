FactoryBot.define do
  factory :post do
    sample_weight = (66.00..75.00).step(2.00).to_a
    current_weight = sample_weight.sample
    date_sample = [2019-01-10, 2019-01-20, 2019-01-30]

    weight { current_weight }
    content { "MyString" }
    date { date_sample }
    training { "MyText" }
    morning { "MyText" }
    lunch { "MyText" }
    dinner { "MyText" }
    snack { "MyText" }
    image { "crossfit-534615.jpg" }
    association :user
  end
end
