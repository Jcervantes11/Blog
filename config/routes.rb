Rails.application.routes.draw do
  devise_for :users
	resources  :articles
	
	#	get "/articles" index
	#	post "/articles" create
	#	delete "/articles/:id" destroy
	#	get "/articles/:id" show
	#	get "/articles/:new" new 
	#	get "/articles/:id/edit" edit
	#	path "/articles/:id" update
	#	put "/articles/:id" update
	

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
