class CardReviewDateThreeDays
  include Interactor

  def call
    user = context.user
    context.params[:review_date] = 3.days.since

    if user.cards.create(context.params)
      context.notice = 'Карточка в базу записана!'
    else
      context.notice = 'Карточка в базу не записана!'
      context.fail!
    end
  end
end
