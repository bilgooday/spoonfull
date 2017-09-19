Rails.application.routes.draw do
  get 'searches/index'

  get 'searches/new'

  get 'searches/show'

  devise_for :users
  root to: 'searches#home'

  resources :recipes do
    resources :comments
  end

  resources :users do
    member do
      get 'dashboard'
    end
  end

  resources :recipes, only: [:index, :show, :home] do
    member do
      post 'add_favorite'
      delete 'remove_favorite'
      post 'add_external_favorite'
      delete 'remove_external_favorite'
      get 'dashboard'
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
