Kashtanka::Application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'registration' }
  
  root to: 'client/home#index'

  namespace :client do
  end

  namespace :admin, path: 'adminka' do
  	get '', to: 'home#index', as: :admin

  	resources :users
  	resources :settings
  	resources :languages

  	[:languages].each do |r|
  		resources r do
  			post :publish, on: :member
  		end
  	end
  end

end
