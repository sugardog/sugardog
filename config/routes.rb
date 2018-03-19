Rails.application.routes.draw do
  	devise_for :users, controllers: {
  		sessions: 'users/sessions',
  		passwords: 'users/passwords',
  		registrations: 'users/registrations'
  	}

  	devise_for :admins, controllers: {
  		sessions: 'admins/sessions',
  		passwords: 'admins/passwords',
  		registrations: 'admins/registrations'
  	}

	root 'cds#index'

	get 'cds/search' => 'cds#search'
	get 'cd_carts/:id/select' => 'cd_carts#select'
	get 'users/:id/quit' => 'users#quit', as: 'quit'

	resources :users do
		resources :histories, only: [:index]
	end

	resources :deliveries
	resources :cds do
		resources :discs do
			resources :songs
		end
	end
	resources :carts
	resources :histories
	resources :genres, except: [:new]
	resources :pop_images, except: [:edit,:update,:show, :new]
	resources :songs
	resources :artists do
		resource :favorites, only: [:create, :destroy]
	end
	resources :campaigns, except: [:show]
	resources :prefectures, except: [:show]
	resource :singers, except: [:show, :index, :edit]
	resources :admins
	resources :cd_carts
	resource :reviews, except: [:show]
	resources :cd_histories, only: [:show]
	resources :cd_genres, only: [:show]

end
