Rails.application.routes.draw do
  
  get("/", { :controller => "actors", :action => "index" })
  
  # ACTORS ROUTES
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

# DIRECTORS ROUTES
  # CREATE
get("/directors/new", { :controller => "directors", :action => "new_form" })
get("/create_director", { :controller => "directors", :action => "create_row" })

# READ
get("/directors", { :controller => "directors", :action => "index" })
get("/directors/:the_id", { :controller => "directors", :action => "show" })

# UPDATE
get("/directors/:an_id/edit", { :controller => "directors", :action => "edit_form" })
get("/update_director/:some_id", { :controller => "directors", :action => "update_row" })

# DELETE
get("/delete_director/:toast_id", { :controller => "directors", :action => "destroy_row" })

# MOVIES ROUTES
  # CREATE
get("/movies/new", { :controller => "movies", :action => "new_form" })
get("/create_movie", { :controller => "movies", :action => "create_row" })

# READ
get("/movies", { :controller => "movies", :action => "index" })
get("/movies/:the_id", { :controller => "movies", :action => "show" })

# UPDATE
get("/movies/:an_id/edit", { :controller => "movies", :action => "edit_form" })
get("/update_movie/:some_id", { :controller => "movies", :action => "update_row" })

# DELETE
get("/delete_movie/:toast_id", { :controller => "movies", :action => "destroy_row" })
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
