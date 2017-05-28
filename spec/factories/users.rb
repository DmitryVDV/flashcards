FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "someone#{rand(1..100000000)}@mail.com" }
    password "MyString"
    provider "vk"
    sequence(:uid) { |n| rand(1000000..10000000) }
    factory :user_with_card do
      after(:create) do |user|
        create(:card, user: user)
      end
    end
  end
end
