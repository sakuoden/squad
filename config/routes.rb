Rails.application.routes.draw do
 	devise_for :users
	get '/' => 'tops#top'
end
