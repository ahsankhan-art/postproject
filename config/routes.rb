Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    collection do
      get :mypost
      resources :likes
    end
  end
  root 'posts#index'
  get 'posts/mypost'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
