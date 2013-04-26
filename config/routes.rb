Diploma::Application.routes.draw do
  resources :projects do
    resources :sprints
    resources :tasks
  end
  devise_for :users
  root :to => 'application#home'
end
