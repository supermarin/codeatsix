Codeatsix::Application.routes.draw do
  post '/apply' => "home#apply", :as => 'apply'
  get '/current' => "home#current"
  
  resources :events
  
  root :to => "home#index"
end
