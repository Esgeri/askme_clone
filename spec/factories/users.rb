FactoryBot.define do
  sequence :username do |u|
    "user#{u}"
  end

  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    username
    email
    password { '123456' }
    password_confirmation { password }
  end
end
