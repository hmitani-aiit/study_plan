Rails.application.routes.draw do
  get 'users/new'
  get 'plan/select'
  get 'plan/list'
  get 'plan/regist'
  root 'plan#login'
end

