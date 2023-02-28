class Admin::GenresController < ApplicationController
  def index
    @genres=Genre.all
    @genre=Genre.new
  end

  def create
    @genres=Genre.new(genre_params)
    @genres.save
    render :index


  end

  def edit
  end


     private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
