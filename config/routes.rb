Codeatsix::Application.routes.draw do
  resources :events
  resources :people
  root :to => "home#index"
  match ':controller(/:action(/:id))(.:format)'
end
