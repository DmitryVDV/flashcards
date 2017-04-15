describe 'Card - testing', :type => :feature do
  
  context 'Main page' do
    let(:card) { FactoryGirl.create(:card) }

    before(:each) do
        visit root_path
      end

    it 'has main page' do
      expect(page).to have_content "Первый в мире удобный"
    end

    it 'has correct answer when input word for translation' do
      fill_in "translation", with: card.translated_text
      click_button "Проверить"
      expect(page).to have_content("Перевод верный", wait:15)
    end

    it 'has uncorrect answer when input word for translation' do
      fill_in "translation", with: "Hl123"
      click_button "Проверить"
      expect(page).to have_content("Неверный ввод", wait:15)
    end

    it 'open card with translation' do
      click_link("link_to_card")
      expect(page).to have_content("привет", wait:15)
    end

    it 'has link Флешкарточкер' do
      click_link("Флэшкарточкер")
      expect(page).to have_content "Первый в мире"
    end

    it 'has link Все карточки' do
      click_link("Все карточки")
      expect(page).to have_content "привет"
    end

    it 'has link Добавить карточки' do
      click_link("Добавить карточку")
      expect(page).to have_content "Original text"
    end
  end

end
