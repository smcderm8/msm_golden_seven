Rails.application.routes.draw do
  
  get("/", { :controller => "actors", :action => "index" })
  
  # CREATE
get("/actors/new", { :controller => "actors", :action => "new_form" })
get("/create_actor", { :controller => "actors", :action => "create_row" })

# READ
get("/actors", { :controller => "actors", :action => "index" })
get("/actors/:the_id", { :controller => "actors", :action => "show" })

# UPDATE
get("/actors/:an_id/edit", { :controller => "actors", :action => "edit_form" })
get("/update_actor/:some_id", { :controller => "actors", :action => "update_row" })

# DELETE
get("/delete_actor/:toast_id", { :controller => "actors", :action => "destroy_row" })
  
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
