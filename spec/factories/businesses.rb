FactoryBot.define do
  factory :business do
    company        { '会社名' }
    name           { '農業' }
    text           { '説明' }
    price          { 1000 }
    category_id { 2 }
    prefecture_id { 2 }

    association :user

    after(:build) do |business|
      business.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
