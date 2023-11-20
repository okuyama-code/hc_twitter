# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :posts do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy]
    resources :reposts, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
  end

  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'posts#index'
  get '/message' => 'home#message'
  get '/message_box' => 'home#message_box'
end
