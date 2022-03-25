Rails.application.routes.draw do
  resources :schedules
  devise_for :users
  root to: 'items#index'
  resources :users, only: :show
  resources :items, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :orders, only: [:index, :create, :edit, :update]
    collection do
      delete 'destroy_all_order'
      get 'search'
      get 'all_edit'
      put 'all_update'
      get 'new_release'
    end    
  end
end
