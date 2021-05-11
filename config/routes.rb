# /api/v1/headlines
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :headlines
    end
  end
end
