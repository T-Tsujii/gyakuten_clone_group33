Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "movies#index"
  resources :movies
  resources :questions do
    resource :answers, only: [:create,:edit,:update,:destroy]
  resources :aws_texts, only: [:index, :show]
  resources :aws_texts do
    resource :read_texts, only: [:create, :destroy]
  end
end
