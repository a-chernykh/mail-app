Rails.application.routes.draw do
  resources :messages, only: %i(new)
end
