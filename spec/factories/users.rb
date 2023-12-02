FactoryBot.define do
  factory :user do
    nick_name             {'test'}
    email                 {Faker::Internet.email}
    password              {'aaa111'}
    password_confirmation {'aaa111'}
    family_name           {'山田'}
    first_name            {'太郎'}
    family_name_kana      {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'1993/05/18'}
  end
end