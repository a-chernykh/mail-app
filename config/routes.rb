Rails.application.routes.draw do
  resources :messages, only: %i(new)

  root to: 'messages#new'
end
