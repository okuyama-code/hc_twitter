# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: %i[show edit update] do
    resource :relationships, only: %i[create destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :posts do
    resources :comments, only: [:create]
    resource :likes, only: %i[create destroy]
    resources :reposts, only: %i[create destroy]
    resource :bookmarks, only: %i[create destroy]
  end

  resources :messages, only: [:create]
  resources :rooms, only: %i[create index show]
  resources :notifications, only: [:index]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'posts#index'
end
