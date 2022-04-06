FactoryBot.define do
  factory :comment do
    text { "MyText" }
    user_id { 1 }
    business_id { 1 }
  end
end
