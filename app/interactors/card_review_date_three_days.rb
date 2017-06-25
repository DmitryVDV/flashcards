class CardReviewDateThreeDays
  include Interactor

  def call
    user = context.user
    context.params[:review_date] = 3.days.since

    new_card = user.cards.create(context.params)

    if newcard.valid?
      context.notice = 'Карточка в базу записана!'
    else
      context.card = new_card
      context.notice = 'Карточка в базу не записана!'
      context.fail!
    end
  end
end
