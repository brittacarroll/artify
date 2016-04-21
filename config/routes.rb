Rails.application.routes.draw do
  root "welcome#index"
  devise_for :galleries
  devise_for :artists

  resources :welcome, only: [:index]
  resources :artists, only: [:index]
  resources :galleries, only: [:index]
  resources :artists_profiles, only: [:show]
end
