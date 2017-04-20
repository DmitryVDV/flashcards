require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many cards' do
    user_test = create(:user_with_card)
    card_test = Card.all
    expect(user_test.cards[0].original_text).to eq "привет"
  end

end
