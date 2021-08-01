# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books
  unauthenticated :user do
    root to: "root#index", as: :unauthenticated_user_root
  end

  authenticated :user do
    root to: "home#index", as: :authenticated_user_root
  end

  namespace :admin do
    resources :dashboard, only: %i[index]
  end

  resources :cats

  resources :home, only: %i[index]

  resources :profile, only: %i[index]
  get "profile/edit" => "profile#edit"
  put "profile" => "profile#update"

  get "select-walk-duration" => "root#select_walk_duration"

  resources :walkers

  devise_for :users,
             controllers: {
               omniauth_callbacks: "users/omniauth_callbacks",
               registrations: "users/registrations",
               sessions: "users/sessions"
             }
end
