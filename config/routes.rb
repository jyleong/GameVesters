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
	post '/signup', to: 'users#create'



	get 'login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	get 'my_portfolio', to: "users#my_portfolio"
	resources :users do
		member do
			get :following, :followers
		end
	end
	resources :transactions, only: [:new,:create, :show, :index]
	##note for show an dindex, only if its user id is for current user

	get 'search_stocks', to: "stocks#search" #stocks controller search action

	resources :relationships, only: [:create, :destroy]

    resources :notifications, only: [:update, :destroy]
    get '/refresh_notifications', to: 'notifications#refresh'
    patch '/mark_all_notifications', to: 'notifications#mark_all'

end
