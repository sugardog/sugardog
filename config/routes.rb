Rails.application.routes.draw do
  devise_for :users

  devise_for :admins

get 'cds/search' => 'cds#search'
get 'cd_carts/:id/select' => 'cd_carts#select'

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
resources :genres, except: [:show]
resources :pop_images, except: [:edit,:update,:show]
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
resources :cd_genre, only: [:show]
end
