Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create, :show, :destroy] do
    resources :orders, only: [:index, :create, :edit, :update]
    collection do
      delete 'destroy_all_order'
    end    
  end
end
