SBTR::Application.routes.draw do
  resources :duels do
    resources :photos
  end

  root :to => "duels#new", :via => :get
end
