Unconference::Application.routes.draw do

  root :to => 'welcome#index'

  match "/auth/:provider/callback" => "sessions#create"

  resources :conferences

end
