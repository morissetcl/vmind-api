# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match '/privacy_policy', to: 'static_pages#privacy_policy', via: 'get', as: :help

  namespace :api do
    namespace :v1 do
      resources :verses
      resources :feelings
    end
  end
end
