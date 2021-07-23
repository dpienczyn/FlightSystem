Rails.application.routes.draw do
  devise_for :users

  devise_for :admins,
    path: 'admins',
    only: [:sessions, :registrations],
    controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations'
    }

  namespace :admins, path: 'admins' do
    resources :flights
  end

  namespace :api do
    namespace :v1 do
      resources :flights, only: [:show, :index] do
        resources :reservations, only: [:destroy, :create, :index]
      end
    end
  end

  resources :flights, only: :index do
    resources :reservations, only: :index
  end

  root 'flights#index'
end
