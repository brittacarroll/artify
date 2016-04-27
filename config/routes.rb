Rails.application.routes.draw do
  root "welcome#index"
  devise_for :galleries
  devise_for :artists

  resources :welcome, only: [:index]
  resources :artists do
    resources :artworks, only: [:new, :create, :index, :destroy]
  end

  resources :galleries, only: [:index]
  resources :artists_profiles, only: [:show, :edit, :update] do
    resources :relations, only: [:create]
  end

  resources :gallery_profiles, only: [:show, :edit, :update]

  #mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :conversations, only: [:index, :show, :destroy]
  resources :messages, only: [:new, :create]
end
