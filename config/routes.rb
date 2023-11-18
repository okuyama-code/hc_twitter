# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy]
    resources :reposts, only: [:create, :destroy]
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'posts#index'
  get '/message' => 'home#message'
  get '/message_box' => 'home#message_box'
end
