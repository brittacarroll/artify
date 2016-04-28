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
  get "mailboxes/inbox" => "mailboxes#inbox", as: :mailbox_inbox
  get "mailboxes/sent" => "mailboxes#sent", as: :mailbox_sent
  get "mailboxes/trash" => "mailboxes#trash", as: :mailbox_trash

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
end
