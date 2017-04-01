class HomeController < ApplicationController
  def index
    @cards = Card.find_more_three_day.random.first
  end

  def meth_checktranslation

    result = CheckTranslation.call(params: permit_params)
    redirect_to root_url, notice: result.notice

  end

  private

  def permit_params
    params.permit(:translation, :card_id)
  end
end
