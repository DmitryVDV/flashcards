class CheckTranslation
  include Interactor

  def call

    card = Card.find_by_id(context.card_id)

    if card.translated_text == context.translation

      # There is updating review_date + 3 day
      if card.update(review_date: 3.days.since)
        context.card = card
      else
        context.fail!(message:'Перевод верный, но дата в базе не обновлена!' )
      end

    else
      context.fail!(message:'Неверный ввод, попробуй другое слово!' )
    end
  end

end
