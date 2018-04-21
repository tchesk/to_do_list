Rails.application.routes.draw do
  root to: 'home#index'

  resources :task, only: [:index, :show]
  resources :task_list, only: [:index, :show]
end
