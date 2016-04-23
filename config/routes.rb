Rails.application.routes.draw do
  root "welcome#index"
  devise_for :galleries
  devise_for :artists

  resources :welcome, only: [:index]
  resources :artists do
    resources :artworks, only: [:new, :create, :index]
  end

  resources :galleries, only: [:index]
  resources :artists_profiles, only: [:show, :edit, :update]
  resources :gallery_profiles, only: [:show, :edit, :update]
  resources :conversations, only: [:index, :show, :destroy]
end
