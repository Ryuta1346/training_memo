FactoryBot.define do
  factory :post do
    weight { "MyString" }
    body_fat_percentage { "MyString" }
    content { "MyText" }
    user { nil }
  end
end
