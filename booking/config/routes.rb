# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  namespace :admin do
    root 'admin#welcome#index'
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end
    resources :trains do
      resources :carriages
    end
    resources :welcome, only: [:index]
    resources :routes
    resources :tickets
  end
  resources :tickets
  resources :users
  resource :search, only: [:show]
  resources :trains, only: %i[index show]
  resources :welcome
end
