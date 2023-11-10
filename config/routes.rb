# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:show, :edit, :update]
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  get '/tweets' => 'home#tweets'
  root 'home#tweets'
  get '/message' => 'home#message'
  get '/message_box' => 'home#message_box'
  get '/tweet_show' => 'home#tweet_show'

end
