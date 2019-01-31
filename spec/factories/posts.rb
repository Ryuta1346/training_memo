FactoryBot.define do
  factory :post do
    sample_weight  = (66.00..75.00).step(2.00).to_a
    current_weight = sample_weight.sample

    weight { current_weight }
    content { "MyString" }
    date { Date.today }
    training { "MyTraining" }
    morning { "MyText" }
    lunch { "MyText" }
    dinner { "MyText" }
    snack { "MyText" }
    association :user
  end
end
