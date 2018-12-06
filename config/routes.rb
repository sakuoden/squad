Rails.application.routes.draw do
 	get '/' => 'tops#top'
 	devise_for :users
end
