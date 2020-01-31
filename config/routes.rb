Rails.application.routes.draw do
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#index'

  get '/search' => 'home#search_page'
  post '/search' => 'home#search_page'
end
