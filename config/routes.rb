Rails.application.routes.draw do
  devise_for :users
  get 'avie/index'
  get 'avie/allusers'
  post 'avie/assign'
  get 'avie/userassign'
  post 'avie/reply'
  get 'avie/home'
  root 'avie#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
