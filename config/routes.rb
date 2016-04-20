Rails.application.routes.draw do
  root "welcome#index"
  devise_for :galleries
  # , controllers: { sessions: 'sessions'}
  devise_for :artists
  # , controllers: { sessions: 'sessions'}



  resources :welcome, only: [:index]
  resources :artists, only: [:index]
  resources :galleries, only: [:index]

end
