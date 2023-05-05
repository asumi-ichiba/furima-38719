FactoryBot.define do
  factory :order_departs do
    post_cord         { '123-4567' }
    area_id           { Faker::Number.between(from: 2, to: 48) } 
    municipalities    { '東京都港区'}
    address           { '3-4'}
    building          { Faker::Address.building_number } 
    telephone         { '08012345678' }
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
