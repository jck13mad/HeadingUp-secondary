class MovieController < ApplicationController

  require 'httparty'

  get '/movies/new' do
    if logged_in?
      erb :'/movies/add_movie'
    else
      redirect to '/login'
    end

  end

  post '/movies/new' do
    if logged_in? && params[:movie_title] != "" 
      @new_movie = Movie.create(params)
      @movie_slug = "#{@new_movie.movie_title}".downcase.gsub(" ", "+")

      @fetched_movie = HTTParty.get("http://www.omdbapi.com/?t=" + @movie_slug + "&apikey=1d2e3615")
      @new_movie.movie_title = @fetched_movie["Title"]
      @new_movie.release_year = @fetched_movie["Year"]
      @new_movie.movie_rating = @fetched_movie["Rated"]
      @new_movie.img_url = @fetched_movie["Poster"]

      @new_movie.user_id = current_user.id 
      @new_movie.save 

      redirect to '/users/index'
    else
      redirect to '/users/index'
    end

  end

  get '/movies' do
    erb :'/movies/movies'
  end

  get '/movies/:id' do
    # @movie = Movie.find(params[:id])
    @movie = Movie.find(params[:id])
    # binding.pry
    erb :'/movies/lone_movie'
  end

  get '/movies/:id/edit' do
    @movie = Movie.find(params[:id])
    erb :'/movies/edit_movie' 
  end

  patch '/movies/:id' do
    @movie = Movie.find(params[:id])
    
    if params[:movie_title] != ""
      @movie_slug = "#{params[:movie_title]}".downcase.gsub(" ", "+")
      @fetched_movie = HTTParty.get("http://www.omdbapi.com/?t=" + @movie_slug + "&apikey=1d2e3615") 
      @movie.update(:movie_title => @fetched_movie["Title"], :release_year => @fetched_movie["Year"], :movie_rating => @fetched_movie["Rated"], :img_url => @fetched_movie["Poster"])
    end

    @movie.user_id = current_user.id
    @movie.save

    redirect to "/movies/#{@movie.id}"

  end

  get '/movies/:id/delete' do
    @movie = Movie.find(params[:id])
    @movie.delete

    redirect to "/"
  end

end
