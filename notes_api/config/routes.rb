Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :notes, only: %i(index)
      scope :sessions do
        devise_for :users, controllers: { sessions: 'api/v1/sessions/users_sessions' }
      end
    end
  end
end
