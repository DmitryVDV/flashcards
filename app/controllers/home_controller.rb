class HomeController < ApplicationController
  def index
    @cards = Card.find_more_three_day.random.first
  end

  def meth_checktranslation

    result = CheckTranslation.call(permit_params)

    if result.success?
      redirect_to root_url, notice: 'Молодцом, проверим следующее слово!'
    else
      redirect_to root_url, alert: 'Неверный ввод, попробуй другое слово!'
    end
  end

  private

  def permit_params
    params.permit(:translation, :card_id)
  end
end
