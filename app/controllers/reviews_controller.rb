class ReviewsController < ApplicationController
  def create
    @cheese = Cheese.find(params[:cheese_id])
    @review = Review.new(new_review_params)
    @review.cheese = @cheese
    @review.user = current_user

    if @review.save
      redirect_to cheese_path(@cheese)
      UserMailer.notification_email(@cheese.user).deliver_now
    else
      if @review.errors
        flash[:notice] = @review.errors.full_messages.join(", ")
      end
      render :'cheeses/show'
    end
  end


  private

  def new_review_params
    params.require(:review).permit(:rating, :body)
  end
end
