Rails.application.routes.draw do

  resource :user, only: [:edit] do
    collection do
      patch 'update_email'
      patch 'update_password'
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'
  resources :cards
  post 'checktranslation' => 'home#meth_checktranslation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
