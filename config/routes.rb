Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :events do
    member do
      post :publish
      post :unpublish
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
