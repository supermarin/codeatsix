Codeatsix::Application.routes.draw do
  post '/apply' => "home#apply", :as => 'apply'
  get '/:slug' => "events#show"
  
  resources :events
  
  root :to => "home#index"
end
