Rails.application.routes.draw do
  root 'pages#index'

  # /api/v1/headlines
  namespace :api do
    namespace :v1 do
      resources :headlines
    end
  end

  # unspecified routes will route to react
  get '*path', to: 'pages#index', via: :all
end
