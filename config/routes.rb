Codeatsix::Application.routes.draw do
  match '/meetup' => "pages#meetup"
  match '/hackathon' => "pages#hackathon"
  match '/location' => "pages#location"
  
  post '/apply' => "pages#apply", :as => 'apply'
  
  resources :events
  
  root :to => 'pages#home' 
end
