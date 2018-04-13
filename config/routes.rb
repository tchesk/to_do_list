Rails.application.routes.draw do
  root to: 'home#index'

  resources :public_task
end
