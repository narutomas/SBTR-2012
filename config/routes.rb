SBTR::Application.routes.draw do
  resources :duels do
    resources :photos

    resources :contestants do
      resources :photos
    end
  end

  root :to => "duels#new", :via => :get
end
