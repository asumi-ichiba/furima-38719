FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    encrypted_password    {password}
    first_name            { 'やマ田' }
    last_name             { '太ろウ' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birth                 {Faker::Date.birthday(min_age: 18, max_age: 65).strftime("%Y-%m-%d")}
  end
end