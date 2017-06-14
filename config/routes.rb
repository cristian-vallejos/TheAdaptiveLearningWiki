Rails.application.routes.draw do
  
  get 'student/home'

  get 'student/show'

  get 'student/search'

  resources :cuestionario

  get 	'/registro',                    to: 'home#register'
  post 	'/registro',                    to: 'home#validate_register'

  get   '/login',                       to: 'home#login'
  post  '/login',                       to: 'home#validate_login'

  get   'search',                       to: 'home#no_student'

  get 	'/experto',                     to: 'expert#home'
  post 	'/experto',                     to: 'expert#create'
  get 	'/experto',                     to: 'expert#show'
  post 	'/experto',                     to: 'expert#show'
  get   '/experto/validar_contenido',   to: 'expert#edit'
  get   '/experto/denie',               to: 'expert#denegar'
  get   '/experto/aprove',              to: 'expert#aprobar'

  get '/estudiante',                    to: 'student#home'
  get '/buscar_contenido',              to: 'student#search'
  get '/results',                       to: 'student#show'
  post '/calificar',                    to: 'student#calificar'

  root 	'home#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
