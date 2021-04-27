FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name_japanese {"田中"}
    first_name_japanese {"ひろし"}
    last_name_katakana {"タナカ"}
    first_name_katakana {"ヒロシ"}
    birthday {Faker::Date.in_date_period}
  end
end
