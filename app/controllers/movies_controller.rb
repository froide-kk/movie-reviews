class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all.order(rating: :desc)
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    render :new and return unless @movie.save
    redirect_to @movie, notice: 'Movie was successfully created.'
  end

  def update
    render :edit and return unless @movie.update(movie_params)
    redirect_to @movie, notice: 'Movie was successfully updated.'
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :rating)
  end
end
