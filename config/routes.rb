Ramenmash::Application.routes.draw do
  resources :judges, :only => [:new, :create, :show]
  resources :photos, :only => [:index]

  root :to => "judges#new"
end
