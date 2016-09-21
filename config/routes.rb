Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}

  root to: "user_profiles#index"
  resources :user_profiles
  resources :dates

end
