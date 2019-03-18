Rails.application.routes.draw do
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
end
