Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :projects, only: [:index]
    resources :users, except: [:new, :edit]
    resources :holidays, only: [:create, :index]

    get 'team', to: 'users#index'
    get 'assign_project/:user_id/:project_id', to: 'users#assign_project'

  end
end
