class ShowUserCard
  include Interactor

  def call
    # Note that the first_or_create method automatically sets the provider and
    # uid fields when creating a new user. The first_or_create! method operates
    # similarly, except that it will raise an Exception if the user record
    # fails validation.

    user = User.where(provider: context['provider'], uid: context['uid']).first_or_create!

    # Почему тут нельзя сделать что-то типа cards = Card.user ???
    context.cards = Card.find_more_three_day.random.where(user_id: user.id).first

  end
end
