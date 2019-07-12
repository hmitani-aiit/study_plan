Rails.application.routes.draw do
  get 'plan/list'
  root 'plan#login'
end

