Ramenmash::Application.routes.draw do
  resources :judges, :only => [:new, :create]

  root :to => "judges#new"
end
