Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  root to: "home#landing_page"

  resources :events
end
