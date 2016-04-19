Rails.application.routes.draw do
  root "welcome#index"
  devise_for :galleries
  devise_for :artists

  resources :welcome, only: [:index]
end
