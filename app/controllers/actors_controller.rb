class ActorsController < ApplicationController
    def new_form
        render("actor_templates/actor_new_form.html.erb")
    end
    
    def create_row
        # Parameters: {"actor_name"=>"", "actor_bio"=>"", "actor_dob"=>"", "actor_image"=>""}
        
        a = Actor.new
        a.name = params["actor_name"]
        a.bio = params["actor_bio"]
        a.dob = params["actor_dob"]
        a.image_url = params["actor_image"]
        a.save
        
        redirect_to("/actors")
        
        #render("actor_templates/actor_create_row.html.erb")
    end
    
    def index
        
        @home = Actor.all.order(:updated_at => :desc)
        
        render("actor_templates/actor_index.html.erb")
    end
    
    def show
        
        @actor = Actor.find(params["the_id"])
        
        render("actor_templates/actor_show.html.erb")
    end
    
    def edit_form
        # Parameters: {"an_id"=>""}
        
        @actor = Actor.find(params["an_id"])
        
        render("actor_templates/actor_edit_form.html.erb")
    end
    
    def update_row
        
        #Parameters: {"actor_name"=>"", "actor_bio"=>"", "actor_dob"=>"", "actor_image"=>"", "some_id"=>""}
        
        @actor = Actor.find(params["some_id"])
        @actor.name = params["actor_name"]
        @actor.bio = params["actor_bio"]
        @actor.dob = params["actor_dob"]
        @actor.image_url = params["actor_image"]
        @actor.save
        
        @actor_id = @actor.id
        
        redirect_to("/actors/#{@actor_id}")
        
        #render("actor_templates/actor_update_row.html.erb")
    end
    
    def destroy_row
        # Parameters: {"toast_id"=>""}
        
        @actor = Actor.find(params["toast_id"])
        @actor.destroy
        
        redirect_to("/actors")
        
        #render("actor_templates/actor_destroy_row.html.erb")
    end
    
end