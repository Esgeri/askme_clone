FactoryBot.define do
  factory :question do
    text { "MyText" }

    association :user
    association :questioning_user, factory: :user
  end
end
