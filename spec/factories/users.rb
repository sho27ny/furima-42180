FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.unique.email }
    password              { 'a1b2c3' }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    date                  { '2000-01-01' }
  end
end

# "Nickname can't be blank",
# "Last name can't be blank",
# "First name can't be blank",
# "Last name kana can't be blank",
# "First name kana can't be blank",
# "Date can't be blank"]
