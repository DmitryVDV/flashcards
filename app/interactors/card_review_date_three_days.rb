class CardReviewDateThreeDays
  include Interactor

  def call
    user = context.user
    context.params[:review_date] = 3.days.since

    newcard = user.cards.create(context.params)

    if newcard.valid?
      context.notice = 'Карточка в базу записана!'
    else
      context.card = newcard
      context.notice = 'Карточка в базу не записана!'
      context.fail!
    end
  end
end
