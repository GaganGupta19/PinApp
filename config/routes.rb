Rails.application.routes.draw do
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
  resources :images
  
  resources :users do 
  	resources :boards do
  		collection do
  			get :board_selection
  			
  		end
  	end
  end
  post '/boards/update_boards'
  root to: "images#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
