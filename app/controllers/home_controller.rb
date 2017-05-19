class HomeController < ApplicationController

  def index

    # Так пришлось сделать так как в Интерактор current_user не передавался
    # была ошбка

    params = ActionController::Parameters.new
    puts params[:id] = current_user.id
    puts params[:provider] = current_user.provider
    puts params[:uid] = current_user.uid


    #@cards = Card.find_more_three_day.random.first

      result = ShowUserCard.call(params)

    @cards = result.cards


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
