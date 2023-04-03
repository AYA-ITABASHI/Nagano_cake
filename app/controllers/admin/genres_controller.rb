class Admin::GenresController < ApplicationController
  def index
    @genre=Genre.all
    @genres=Genre.new
  end

  def create
    @genres=Genre.new(genre_params)
    @genres.save
    render :index


  end

  def edit
    @genre=Genre.find(params[:id])
  end

  def update
   @genre=Genre.find(params[:id])
   @genre.update(params.update)
  end


     private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
