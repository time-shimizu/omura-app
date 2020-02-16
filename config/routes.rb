Rails.application.routes.draw do
  root 'microposts#index'
  resources :microposts, only: [:index, :show, :create]
end
