Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "assignments#index"
  # Routes for the Course resource:
  # CREATE
  get "/courses/new", :controller => "courses", :action => "new"
  post "/create_course", :controller => "courses", :action => "create"

  # READ
  get "/courses", :controller => "courses", :action => "index"
  get "/courses/:id", :controller => "courses", :action => "show"

  # UPDATE
  get "/courses/:id/edit", :controller => "courses", :action => "edit"
  post "/update_course/:id", :controller => "courses", :action => "update"

  # DELETE
  get "/delete_course/:id", :controller => "courses", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Assignment resource:
  # CREATE
  get "/assignments/new", :controller => "assignments", :action => "new"
  post "/create_assignment", :controller => "assignments", :action => "create"

  # READ
  get "/assignments", :controller => "assignments", :action => "index"
  get "/assignments/:id", :controller => "assignments", :action => "show"

  # UPDATE
  get "/assignments/:id/edit", :controller => "assignments", :action => "edit"
  post "/update_assignment/:id", :controller => "assignments", :action => "update"

  # DELETE
  get "/delete_assignment/:id", :controller => "assignments", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
