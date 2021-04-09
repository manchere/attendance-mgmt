# == Route Map
#

Rails.application.routes.draw do
  root 'attendances#new'
  get '/attendances', to: 'users#user_attendances', as: :user_attendances
  get '/users', to: 'users#index', as: :search_page
  resources :attendances
  resources :users, except: [:index]
end
