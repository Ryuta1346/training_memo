Rails.application.routes.draw do
  root 'static_pages#home'
  get 'about',      to: 'statci_pages#about'
  get 'help',       to: 'statci_pages#help'
  get 'contact',    to: 'statci_pages#contact'

  devise_for :users

  resources :users, only:[:show, :index]
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
