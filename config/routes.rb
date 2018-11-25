Rails.application.routes.draw do

  get '/lookup', to: 'backend#lookup'
  get '/stats', to: 'backend#stats'
  
  root 'site#index'

  get '/index.html', to: 'site#index'

  # get '/about', to: 'site#about'

  get '/gallery', to: 'site#gallery'

  #get '/artist', to: 'site#artist'
  get '/artist/:username', to: 'site#artist', as: 'artist'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
