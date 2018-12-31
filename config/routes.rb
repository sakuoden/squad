Rails.application.routes.draw do
  get 'post_comments/create'
 	get '/' => 'tops#top'

 	devise_for :users

 	resources :users, only: [:show, :edit, :update]
 	get '/user' => 'users#mypage'
 	get '/user/edit' => 'users#mypage_edit'
 	patch '/user/edit' => 'users#mypage_update'

 	resources :teams, only: [:new, :create, :show]
 	post '/teams/:id/member/create' => 'teams#member_create'
 	get '/teams/:id/member/new' => 'teams#member_new'
 	get '/teams/member/edit' => 'teams#member_edit'
 	patch '/teams/member/edit' => 'teams#member_update'
 	get '/teams/:id/member' => 'teams#member'

 	resources :posts, only: [:new, :create]

 	resources :post_favorites, only: [:create, :destroy]

 	resources :post_comments, only: [:create]

 	resources :user_points, only: [:create]

 	resources :chats, only: [:show, :create]

end
