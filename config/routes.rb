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

  	namespace :admin do
  		resources :users
  	end

	root 'cds#index'

	# get 'search', to: 'application#search'
	get 'cds/search' => 'cds#search'
	get 'carts/:id/select' => 'carts#select'
	get 'carts/:id/confirm' => 'carts#confirm'
	get 'users/:id/quit' => 'users#quit', as: 'quit' # 退会ページへのパス
	get 'users/:id/history' => 'users#history', as: 'user_history'

	resources :deliveries, except: [:index, :show]

	resources :cds do
		resource :cd_carts
		resources :discs, except: [:index, :show]
			# resources :songs
		# end
	end
	resources :carts
	resources :histories, except: [:show]
	resources :genres, except: [:new]
	resources :pop_images, except: [:edit,:update,:show, :new]
	resources :songs
	resources :artists do
		resource :favorites, only: [:create, :destroy]
	end
	resources :campaigns, except: [:show]
	resources :prefectures, except: [:new]
	resource :singers, except: [:show, :index, :edit]
	resources :admins
	resource :reviews, except: [:show]

	resources :cd_histories, only: [:show]
	resources :cd_genres, only: [:show]

end
