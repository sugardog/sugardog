Rails.application.routes.draw do
  	devise_for :users

  	devise_for :admins

	root 'cds#index'
	get 'cds/search' => 'cds#search'
	get 'cd_carts/:id/select' => 'cd_carts#select'


	resources :users do
		resources :histories, only: [:index]
			resource :cd_carts
	end

	resources :deliveries
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
	resources :prefectures, except: [:show]
	resource :singers, except: [:show, :index, :edit]
	resources :admins
	resource :reviews, except: [:show]
	resources :cd_histories, only: [:show]
	resources :cd_genres, only: [:show]

end
