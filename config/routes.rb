SBTR::Application.routes.draw do
  resources :duels do
    collection do
      get :latest
    end

    resources :photos

    resources :contestants do
      resources :photos
    end
  end

  match "/about", :to => "static#about", :via => :get

  root :to => "duels#latest", :via => :get
end
