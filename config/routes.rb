Codeatsix::Application.routes.draw do
  resources :events

  post '/apply' => "home#apply"
  match '/events/:slug' => "events#show"
  
  root :to => "home#index"
end
