Rails.application.routes.draw do

  root 'home#index'
  resources :cards
  post 'checktranslation' => 'home#meth_checktranslation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
