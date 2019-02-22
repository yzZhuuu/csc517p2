Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :tours
      resources :reviews
      resources :books
      #resources :waitlists


      # root to: "users#index"
  end


  devise_for :users, path: 'users', controllers: {
      registrations: "users/registrations"}

  resources :tours do
    resources :reviews
    resources :photos
    resources :books
    resources :waitlists
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  # get 'tours/dashboard' => 'tours#dashboard'
end
