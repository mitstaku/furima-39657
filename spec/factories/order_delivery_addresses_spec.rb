FactoryBot.define do
  factory :order_delivery_address do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    order_id { Faker::Number.non_zero_digit }
    zip_code           { '112-0004' }
    prefecture_id      { Faker::Number.between(from: 1, to: 47) }
    city               { '文京区後楽' }
    street_address     { '1-3-61' }
    building_name      { '東京ドーム' }
    telephone_number   { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
