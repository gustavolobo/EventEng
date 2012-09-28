EventEng::Engine.routes.draw do
  
  match "/calendar(/:year(/:month))" => 'events#calendar', :as => :calendar, :via => :get, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  resources :events

end
