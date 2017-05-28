require 'rails_helper'

describe CardReviewDateThreeDays do
  describe ".call" do

    it 'has create card in DataBase' do

      fill_in "translation", with: @card.translated_text
      click_button "Проверить"
      expect(page).to have_content("Перевод верный", wait:15)
    end

    it 'has set reciewdate since 3 days during card creation' do

    end

  end
end
