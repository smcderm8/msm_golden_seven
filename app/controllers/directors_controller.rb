class DirectorsController < ApplicationController
    def new_form
        render("director_templates/director_new_form.html.erb")
    end
    
    def create_row
        # Parameters: {"director_name"=>"", "director_bio"=>"", "director_dob"=>"", "director_image"=>""}
        
        d = Director.new
        d.name = params["director_name"]
        d.bio = params["director_bio"]
        d.dob = params["director_dob"]
        d.image_url = params["director_image"]
        d.save
        
        redirect_to("/directors")
        
        #render("director_templates/director_create_row.html.erb")
    end
    
    def index
        
        @home = Director.all
        
        render("director_templates/director_index.html.erb")
    end
    
    def show
        
        @director = Director.find(params["the_id"])
        
        render("director_templates/director_show.html.erb")
    end
    
    def edit_form
        # Parameters: {"an_id"=>""}
        
        @director = Director.find(params["an_id"])
        
        render("director_templates/director_edit_form.html.erb")
    end
    
    def update_row
        
        #Parameters: {"director_name"=>"", "director_bio"=>"", "director_dob"=>"", "director_image"=>"", "some_id"=>""}
        
        @director = Director.find(params["some_id"])
        @director.name = params["director_name"]
        @director.bio = params["director_bio"]
        @director.dob = params["director_dob"]
        @director.image_url = params["director_image"]
        @director.save
        
        @director_id = @director.id
        
        redirect_to("/directors/#{@director_id}")
        
        #render("director_templates/director_update_row.html.erb")
    end
    
    def destroy_row
        # Parameters: {"toast_id"=>""}
        
        @director = Director.find(params["toast_id"])
        @director.destroy
        
        redirect_to("/directors")
        
        #render("director_templates/director_destroy_row.html.erb")
    end
    
end