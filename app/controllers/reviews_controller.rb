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
        flash[:error] = @review.errors.full_messages.join(', ')
      end
      render :'cheeses/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @cheese = @review.cheese
    if current_user.admin? || current_user == @review.user
      @review.destroy
      flash[:notice] = 'Review deleted'
      redirect_to @cheese
    else
      flash[:error] = 'Insufficient access rights.'
      redirect_to root_path
    end
  end

  private

  def new_review_params
    params.require(:review).permit(:rating, :body)
  end
end
