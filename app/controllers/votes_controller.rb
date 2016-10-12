class VotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @user = current_user
    @vote = Vote.find_by user: @user, review: @review

    if @vote
      @vote.vote = @vote.vote == params[:vote].to_i ? 0 : params[:vote]
    else
      @vote = Vote.new(vote: params[:vote], review: @review, user: current_user)
    end
    @vote.save if @vote.valid?
    render json: {vote_total: @review.total_votes, review_id: @review.id}
  end
end
