Rails.application.routes.draw do

  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  get    '/lectures',   to: 'lectures#index'
  get    '/lectures_data',   to: 'lectures#data'
  post    '/lectures',  to: 'lectures#save'
end
