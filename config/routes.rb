Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

resources :task_lists, only: [:index, :show, :new, :create] do
   resources :tasks, only: [:index, :show, :new, :create]
 end
end
