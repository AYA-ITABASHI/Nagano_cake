class Admin::GenresController < ApplicationController
  def index
    @genr=Genr.all
  end

  def edit
  end
end
