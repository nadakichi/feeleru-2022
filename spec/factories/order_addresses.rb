FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '222-2222' }
    prefecture_id { 2 }
    city { '長崎' }
    address { '1-1-1' }
    building { 'ながさき' }
    telephone { '09012345678' }
  end
end
