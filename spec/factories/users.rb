FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa000000' }
    password_confirmation { password }
    surname               { '山田' }
    surname_katakana      { 'ヤマダ' }
    giben_name            { '太郎' }
    giben_name_katakana { 'タロウ' }
    dete_of_bith { '2000-01-01' }
  end
end
