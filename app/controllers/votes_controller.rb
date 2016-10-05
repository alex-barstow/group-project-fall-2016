class VotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @vote = Vote.new(vote: params[:vote], review: @review, user: current_user)
    binding.pry
  end
end
