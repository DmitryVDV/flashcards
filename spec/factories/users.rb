FactoryGirl.define do
  factory :user do
    email "my@mail.ru"
    password "MyString"

    factory :user_with_card do
      after(:create) do |user|
        create(:card, user: user)
      end
    end
  end
end
