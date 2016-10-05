class CheesesController < ApplicationController
  def index
    @cheeses = Cheese.all
  end
  def show
    @cheese = Cheese.find(params[:id])
    @review = Review.new
    @review.user = current_user
    @reviews = @cheese.reviews
  end
end
