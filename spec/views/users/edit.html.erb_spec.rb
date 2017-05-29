require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation, {:only => %w[users cards]}

RSpec.describe 'users/edit.html.erb', type: :feature do
  context 'Main page' do
    before do
      DatabaseCleaner.clean
      @card = create(:card)
      @user = @card.user
      @user_id = @user.id
      sign_in @user
      visit root_path
      click_link('link_to_profile')
    end

    it 'has load page and forms' do
      expect(page).to have_content 'Отредактируйте email или пароль'
    end

    it 'has change email in data base' do
      fill_in 'user_email', with: 'new_mail@mail.ru'
      click_button 'Обновить Email'
      user_new = User.where(id: @user_id).first
      expect(user_new.email).to eq('new_mail@mail.ru')
    end

    it 'has change password in data base' do
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_button 'Обновить пароль'
      valid_password = User.find_by_email(@user.email).valid_password?('123456')
      expect(valid_password).to eq(true)
    end
  end
end
