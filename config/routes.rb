Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :projects, only: [:index]
    resources :users, except: [:new, :edit]
    get '/team', to: 'users#index'
  end
end
