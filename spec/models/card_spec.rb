require 'rails_helper'

RSpec.describe Card, :type => :model do

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
