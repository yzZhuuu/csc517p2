Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :tours
      resources :reviews
      resources :books
      resources :waitlists
    #  resources :photos



       #root to: "users#index"
  end


  devise_for :users, path: 'users', controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: "users/registrations"}

  # get 'users/sign_in', to: 'sessions#create', as: :create_login

  resources :tours do
    resources :reviews
    resources :photos
    resources :books
    resources :waitlists
    resources :bookmarks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get 'home/waitlistboard' => 'home#waitlistboard'
  get 'home/booklistboard' => 'home#booklistboard'
  get 'home/bookmarklistboard' => 'home#bookmarklistboard'
  get 'home/agenttourlist' => 'home#agenttourlist'
end
