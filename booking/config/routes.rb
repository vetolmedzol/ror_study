# frozen_string_literal: true

Rails.application.routes.draw do
  resources :railway_stations
  resources :trains
  resources :routes
  resources :tickets
  resources :users
  resources :welcome
  # get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
