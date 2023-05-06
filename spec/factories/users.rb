FactoryBot.define do
  sequence :username do |n|
    "user#{n}"
  end

  factory :user do
    username
    password { 'Qwerty@12345678' }
    password_confirmation { 'Qwerty@12345678' }
  end
end
