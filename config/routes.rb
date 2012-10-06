SBTR::Application.routes.draw do
  resources :duels

  root :to => "duels#new", :via => :get
end
