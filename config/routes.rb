Rails.application.routes.draw do
  get 'pages/home', to:'pages#home'
  get 'pages/about', to:'pages#about'
  root'pages#home'

  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
