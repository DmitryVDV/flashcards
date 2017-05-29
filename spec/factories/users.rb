FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "someone#{n}@mail.com" }
    password "MyString"
    provider "vk"
    sequence(:uid) { |n| n }
    factory :user_with_card do
      after(:create) do |user|
        create(:card, user: user)
      end
    end
  end
end
