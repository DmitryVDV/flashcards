class HomeController < ApplicationController
  def index
    # Is it good code style or there is better way?
    params = ActionController::Parameters.new
    params[:id] = current_user.id
    params[:provider] = current_user.provider
    params[:uid] = current_user.uid

    result = ShowUserCard.call(params)
    @card = result.cards
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
