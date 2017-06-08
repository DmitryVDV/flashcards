class CardsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @cards = current_user.cards
  end

  def show; end

  def new
    @card = Card.new
  end

  def edit; end

  def create
    result = CardReviewDateThreeDays.call(params: card_params, user: current_user)

    if result
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def update
    if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to action: :index
  end

  private

  def find_params
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :cardimage, :remote_cardimage_url)
  end
end
