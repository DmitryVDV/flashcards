require 'rails_helper'

RSpec.describe Card, :type => :model do

  it "plus three day to review_date" do
    user_test = create(:user_with_card)
    card_test = Card.last
    expect(card_test.send(:plus_three_day).strftime("%Y %m %d")).to eq(3.days.since.strftime("%Y %m %d"))
  end

  it "insert date field original_text without space in begin and all downcase" do
    user_test = create(:user_with_card)
    card_test = Card.last
    expect(card_test.original_text).to eq "привет"
  end

  it "insert date field translated_text without space in begin and all downcase" do
    user_test = create(:user_with_card)
    card_test = Card.last
    expect(card_test.translated_text).to eq "hello"
  end

  it "it has one user" do
    user_test = create(:user_with_card)
    card_test = Card.last
    expect(card_test.user.email).to eq "my@mail.ru"
  end

  it "there is no cards without user" do
  end

end
