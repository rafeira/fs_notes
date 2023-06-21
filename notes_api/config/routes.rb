Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :notes, only: %i(index create)
      scope :sessions do
      end
    end
  end

  devise_for :users,
    module: 'api/v1/users',
    path: 'api/v1/users',
    controllers: {
      sessions: 'api/v1/users/sessions'
    }
end
