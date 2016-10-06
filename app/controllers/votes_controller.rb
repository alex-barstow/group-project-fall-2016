class VotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @vote = Vote.new(vote: params[:vote], review: @review, user: current_user)

    @vote.save if @vote.valid?

    render json: {vote_total: @review.total_votes, review_id: @review.id}
  end
end
