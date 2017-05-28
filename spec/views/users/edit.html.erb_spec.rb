require 'rails_helper'
require 'awesome_print'
require 'pry'
require 'hirb'

RSpec.describe "users/edit.html.erb", type: :feature do
  context 'Main page' do
    before do

        @card = create(:card)
        @user = @card.user
        @user_id = @user.id

        sign_in @user
        visit root_path
        click_link("link_to_profile")
    end

    it 'has load page and forms' do
      expect(page).to have_content "Отредактируйте email или пароль"
    end

    it 'has change email in data base' do

      fill_in "user_email", with: "new_mail@mail.ru"
      click_button "Обновить Email"
      user_new = User.where(id: @user_id).first
       expect(user_new.email).to eq("new_mail@mail.ru")
    end

    it 'has change password in data base' do
    end

   end


end
