Ramenmash::Application.routes.draw do
  resources :judges, :only => [:new, :create, :show]

  root :to => "judges#new"
end
