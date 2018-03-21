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
  		resources :users do
  			resources :deliveries, except: [:index, :show]
  		end
  		# resources :reviews
  		# resources :histories
  	end

	root 'cds#index'
	get 'cds/search' => 'cds#search'
	get 'cd_carts/:id/select' => 'cd_carts#select'
	get 'users/:id/quit' => 'users#quit', as: 'quit' # 退会ページへのパス

	resources :users do
		resources :histories, only: [:index]
	end

	resources :cds do
		resources :discs, except: [:index, :show]
			# resources :songs
		# end
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
	resources :prefectures, except: [:new]
	resource :singers, except: [:show, :index, :edit]
	resources :admins
	resources :cd_carts
	resources :reviews, except: [:show]
	resources :cd_histories, only: [:show]
	resources :cd_genres, only: [:show]

end
