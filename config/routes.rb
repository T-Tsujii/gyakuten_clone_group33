Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "movies#index"
  resources :movies
  resources :aws_texts, only: [:index, :show]
  resources :questions
  resources :aws_texts do
    resource :read_texts, only: [:create, :destroy]
  end
end
