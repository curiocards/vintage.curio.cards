Rails.application.routes.draw do

  get '/lookup', to: 'backend#lookup'
  get '/stats', to: 'backend#stats'
  
  root 'site#index', as: 'index'

  get '/index.html', to: 'site#index'

  # get '/about', to: 'site#about'

  get '/gallery', to: 'site#gallery'

  get '/artist/:username', to: 'site#artist', as: 'artist'

  get '/card/:id', to: 'site#single_card', as: 'card'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
