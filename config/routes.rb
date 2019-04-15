Rails.application.routes.draw do
  resources :camp_counselors
  resources :camper_registrations
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/search', to: 'home#search', as: :search
  root 'home#index'
  
  resources :camper_camp_badge_tasks
  resources :camper_camp_badges
  resources :counselor_camp_badges
  resources :tasks
  resources :badges
  resources :skills
  resources :camp_badges
  resources :camps
  resources :locations
  resources :branches
  resources :campers
  resources :counselors
  resources :parents
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
  resources :users
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout
end
