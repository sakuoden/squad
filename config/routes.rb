Rails.application.routes.draw do

  resources :invitations, only: [:create, :destroy]

	get '/' => 'tops#top'
 	get '/map' => 'tops#map'

 	devise_for :users

 	resources :users, only: [:show, :edit, :update]
 	get '/users/:id/follow' => 'users#follow'
 	get '/users/:id/belong' => 'users#belong'

 	resources :teams, only: [:new, :create, :show]
 	get '/teams/:id/member/new' => 'teams#member_new'
 	post '/teams/:id/member/create' => 'teams#member_create'
	get '/teams/:id/member' => 'teams#member'
	post '/teams/:id/member/:id/invite' => 'teams#invite'
  get '/teams/:id/show_add_post' => 'teams#show_add_post'

 	resources :posts, only: [:new, :create]

 	resources :post_favorites, only: [:create, :destroy]

 	resources :follows, only: [:create, :destroy]

 	resources :post_comments, only: [:create]

 	resources :user_points, only: [:create]

 	resources :chats, only: [:show, :create]

end
