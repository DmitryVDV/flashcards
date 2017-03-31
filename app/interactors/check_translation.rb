class CheckTranslation
  include Interactor

  def call
    card = Card.find_by(id: context.params[:card_id])
    context.notice = ''

    if card.nil?
      context.fail!(message: 'Карточка в базе не найдена')
    else

      if card.translated_text == context.params[:translation]

        # There is updating review_date + 3 day
        if card.update(review_date: 3.days.since)
          context.card = card
          context.notice = 'Перевод верный, дата карточки обновлена'
        end
      else
        context.notice = 'Неверный ввод, попробуй другое слово!'
      end
    end
  end

end
