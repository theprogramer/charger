Charger::Engine.routes.draw do

  resources :subscriptions, only: [:index, :show, :update]
  resources :plans, only: [:index, :show]

end
