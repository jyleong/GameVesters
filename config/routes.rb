Rails.application.routes.draw do

  resources :user_stocks, except: [:show, :edit,:update]
  resources :stocks
  get 'sessions/new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'static_pages#home'	
	get '/home', to: 'static_pages#home'
	get '/help', to: 'static_pages#help'
	get '/about', to: 'static_pages#about'
	get '/contact', to: 'static_pages#contact'
	get '/signup', to: 'users#new'
	get '/question', to: 'questions#display_question'


	post '/signup', to: 'users#create'

	get 'login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

	resources :users do
		member do
			get :following, :followers
		end
	end

	get 'search_stocks', to: "stocks#search" #stocks controller search action

	resources :relationships, only: [:create, :destroy]

end
