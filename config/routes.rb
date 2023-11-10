# frozen_string_literal: true

Rails.application.routes.draw do
  # TODO showをrotingに追加したらログイン画面が映らない
  # resources :users, only: [:show, :edit, :update]
  resources :users, only: [ :edit, :update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  get '/tweets' => 'home#tweets'
  root 'home#tweets'
  get '/message' => 'home#message'
  get '/message_box' => 'home#message_box'
  get '/tweet_show' => 'home#tweet_show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    # get 'user/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
    # root "users/sessions#new"
    # root "users/registrations#new"
  end
end
