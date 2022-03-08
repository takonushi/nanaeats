Rails.application.routes.draw do
  resources :schedules
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :orders, only: [:index, :create, :edit, :update]
    collection do
      delete 'destroy_all_order'
      get 'search'
    end    
  end
end
