AnonymousDingo::Application.routes.draw do
  root 'events#new'

  get 'events/new' => 'events#new'
  post 'events' => 'events#create'
  get 'events/:id' => 'events#show', as: :event
end
