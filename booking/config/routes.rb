# frozen_string_literal: true

Rails.application.routes.draw do
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :trains do
    resources :carriages
  end
  resources :routes
  resources :tickets
  resources :users
  resources :welcome
  resource  :search, only: %i[show create]

  # get 'welcome/index'

  root 'welcome#index'
end
