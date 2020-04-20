Rails.application.routes.draw do
  get 'grayscale/index'
  get "/searches", to: "searches#index"
  root to: "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
