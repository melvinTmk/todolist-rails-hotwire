Rails.application.routes.draw do

  root "tasks#index"

  resources :tasks

  post "tasks/:id/toggle", to:"tasks#toggle"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
