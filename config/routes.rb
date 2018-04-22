Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :task, only: [:index, :show]
  resources :task_list, only: [:index, :show]
end
