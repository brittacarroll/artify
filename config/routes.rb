Rails.application.routes.draw do
  devise_for :galleries
  devise_for :artists

  # root "artworks#index"



  #
  # devise_scope :galleries do
  #   get "galleries/sign_in" => "galleries/sessions#new"
  #   get "galleries/sign_out" => "galleries/sessions#destroy"
  # end


  # devise_scope :artist do
  #   get "artists/sign_in" => "artists/sessions#new"
  #   get "artists/sign_up" => "artists/registrations#new"
  #   get "artists/sign_out" => "artists/sessions#destroy"
  # end
end
