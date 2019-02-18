Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/new'
  get 'users/show'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('users/index')
end
