Rails.application.routes.draw do
  namespace :api do
    resources :upcoming_events, only: [:index]
  end
end
