Charger::Engine.routes.draw do

  resources :subscriptions, only: [:index, :show, :update]

end
