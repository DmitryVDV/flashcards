class HomeController < ApplicationController
  def index
    @cards = Card.find_more_three_day.random.limit(1)
  end

  def meth_checktranslation
    puts view_translated_text = params[:checktranslation_input_param]
    puts view_card_id = params[:card_id]

    # This code may be done by scope in cards.rb
    # scope :scope_checktranslation, ->(card_id) { where("card_id = ?", card_id)
    @card = Card.find_by_id(view_card_id)

    if @card.translated_text == view_translated_text
      # There is updating review_date + 3 day
      @card.update(review_date: 3.days.since)
      redirect_to root_url, notice: 'Молодцом, проверим следующее слово!'
    else
      redirect_to root_url, alert: 'Неверный ввод, попробуй другое слово!'
    end
  end
end
