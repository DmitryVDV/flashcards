class CheckTranslation
  include Interactor

  def call
    card = Card.find_by(id: context.params[:card_id])
    context.notice = ''
    context.card = card
    if card.nil?
      context.notice = 'Карточка в базе не найдена!'
      context.fail!
    else
      if card.translated_text == context.params[:translation]
        # There is updating review_date + 3 day
        if card.update(review_date: 3.days.since)
          context.notice = 'Перевод верный, дата карточки обновлена'
        end
      else
        context.notice = 'Неверный ввод, попробуй другое слово!'
        context.fail!
      end
    end
  end

end
