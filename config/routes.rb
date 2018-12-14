Rails.application.routes.draw do
 	get '/' => 'tops#top'

 	devise_for :users
 	get '/user' => 'users#mypage'
 	get '/user/edit' => 'users#mypage_edit'
 	patch 'user/edit' => 'users#mypage_update'
 	get 'user/:id' => 'users#show'

 	resources :teams, only: [:new, :create, :show]

 	get 'member' => 'team#member'
end
