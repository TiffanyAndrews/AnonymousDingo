AnonymousDingo::Application.routes.draw do
  root 'events#new'

  get  'events/new'   => 'events#new'
  get  'events/:id'   => 'events#show', as: :event
  post 'events'       => 'events#create'
  post 'events/rsvps' => 'events#rsvps'

end
