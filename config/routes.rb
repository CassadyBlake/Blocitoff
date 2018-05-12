Rails.application.routes.draw do
  get 'users/show/:id' => 'users#show', as: 'users_show'

  devise_for :users

  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
