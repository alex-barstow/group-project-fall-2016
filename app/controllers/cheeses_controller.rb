class CheesesController < ApplicationController

  def index
    @cheeses = Cheese.all
  end


end
