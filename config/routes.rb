Diploma::Application.routes.draw do
  resources :projects do
    resources :members, only: [:index, :create, :update, :destroy]
    resources :sprints, except: [:index]
    resources :tasks, except: [:index]
  end
  devise_for :users
  root :to => 'application#home'
end
