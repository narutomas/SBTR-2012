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

  root :to => "duels#latest", :via => :get
end
