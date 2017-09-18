Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#home'

  resources :recipes do
    resources :comments
  end

  resources :recipes, only: [:index, :show, :home] do
    member do
      post 'add_favorite'
      delete 'remove_favorite'
    end
  end
end

  # get 'comments/new'
  #
  # get 'comments/edit'
  #
  # get 'comments/show'
  #
  # get 'recipes/index'
  #
  # get 'recipes/new'
  #
  # get 'recipes/edit'
  #
  # get 'recipes/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
