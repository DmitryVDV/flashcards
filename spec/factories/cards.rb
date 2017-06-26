FactoryGirl.define do

  factory :card do
    original_text " Привет"
    translated_text " Hello"
    review_date 4.days.ago
    user
    image { File.new("#{Rails.root}/spec/features/test_img.jpg") }
  end

end
