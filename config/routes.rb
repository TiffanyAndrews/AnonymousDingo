AnonymousDingo::Application.routes.draw do
  root 'events#new'

   get 'events' => 'events#new'
  post 'events' => 'events#create'
end
