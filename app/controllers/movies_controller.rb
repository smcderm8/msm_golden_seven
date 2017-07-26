class MoviesController < ApplicationController
    def new_form
        render("movie_templates/movie_new_form.html.erb")
    end
    
    def create_row
        # Parameters: {"movie_title"=>"", "movie_year"=>"", "movie_duration"=>"", "movie_description"=>"", movie_image"=>""}
        
        m = Movie.new
        m.title = params["movie_title"]
        m.year = params["movie_year"]
        m.duration = params["movie_duration"]
        m.description = params["movie_description"]
        m.image_url = params["movie_image"]
        m.save
        
        redirect_to("/movies")
        
        #render("movie_templates/movie_create_row.html.erb")
    end
    
    def index
        
        @home = Movie.all
        
        render("movie_templates/movie_index.html.erb")
    end
    
    def show
        
        @movie = Movie.find(params["the_id"])
        
        render("movie_templates/movie_show.html.erb")
    end
    
    def edit_form
        # Parameters: {"an_id"=>""}
        
        @movie = Movie.find(params["an_id"])
        
        render("movie_templates/movie_edit_form.html.erb")
    end
    
    def update_row
        
        # Parameters: {"movie_title"=>"", "movie_year"=>"", "movie_duration"=>"", "movie_description"=>"", movie_image"=>""}
        
        @movie = Movie.find(params["some_id"])
        @movie.title = params["movie_title"]
        @movie.year = params["movie_year"]
        @movie.duration = params["movie_duration"]
        @movie.description = params["movie_description"]
        @movie.image_url = params["movie_image"]
        @movie.save
        
        @movie_id = @movie.id
        
        redirect_to("/movies/#{@movie_id}")
        
        #render("movie_templates/movie_update_row.html.erb")
    end
    
    def destroy_row
        # Parameters: {"toast_id"=>""}
        
        @movie = Movie.find(params["toast_id"])
        @movie.destroy
        
        redirect_to("/movies")
        
        #render("movie_templates/movie_destroy_row.html.erb")
    end
    
end