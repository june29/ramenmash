Ramenmash::Application.routes.draw do
  resources :judges, :only => [:new]

  root :to => "judges#new"
end
