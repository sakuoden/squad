Rails.application.routes.draw do
 	get '/' => 'tops#top'

 	devise_for :users

 	resources :users, only: [:show]
 	get '/user' => 'users#mypage'
 	get '/user/edit' => 'users#mypage_edit'
 	patch 'user/edit' => 'users#mypage_update'

 	resources :teams, only: [:new, :create, :show]
 	get '/member/:id' => 'teams#member'
 	get '/member/:id/edit' => 'teams#member_edit'
end
