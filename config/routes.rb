Rails.application.routes.draw do
 	get '/' => 'tops#top'

 	devise_for :users

 	resources :users, only: [:show]
 	get '/user' => 'users#mypage'
 	get '/user/edit' => 'users#mypage_edit'
 	patch 'user/edit' => 'users#mypage_update'

 	resources :teams, only: [:new, :create, :show]
 	post 'teams/:id/member/create' => 'teams#member_create'
 	get 'teams/:id/member/new' => 'teams#member_new'
 	get 'teams/:id/member' => 'teams#member'
 	get 'teams/:id/member/edit' => 'teams#member_edit'
end
