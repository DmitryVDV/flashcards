require 'rails_helper'

describe ShowUserCard do
  describe '.call' do
    before do
      @card = create(:card)
      @user = @card.user
    end

    subject { ShowUserCard.call(provider: @user.provider, uid: @user.uid) }
    it 'has some cards in ShowUserCard interactor' do
      expect(subject.cards.translated_text).to eq('hello')
    end
  end
end
