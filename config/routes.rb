Rails.application.routes.draw do
  root to: 'home#index'

  resources :task
  resources :task_list, only:[:index, :show]
end
