Rails.application.routes.draw do
  resources :recipes
  resources :categories

  root "recipes#index"
end
