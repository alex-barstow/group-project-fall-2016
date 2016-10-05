class CheesesController < ApplicationController
  before_action :fetch_cheese, only: [:show, :edit, :update]

  def index
    @cheeses = Cheese.all
  end

  def show
  end

  def new
    unless current_user
      flash[:error] = 'Must be signed in to add cheese.'
      redirect_to root_path
    end
    @cheese = Cheese.new
  end

  def create
    @cheese = Cheese.new(cheese_params)
    @cheese.user = current_user
    if @cheese.valid?
      @cheese.save
      flash[:notice] = 'Cheese added successfully.'
      redirect_to @cheese
    else
      errors = fetch_errors
      flash[:error] = errors
      render :new
    end
  end

  def edit
    unless current_user == @cheese.user
      flash[:error] = "That's not your cheese!."
      redirect_to @cheese
    end
  end

  def update
    @cheese.assign_attributes(cheese_params)
    if @cheese.valid?
      @cheese.save
      flash[:notice] = 'Cheese updated successfully.'
      redirect_to @cheese
    else
      errors = fetch_errors
      flash[:error] = errors
      render :edit
    end
  end

  private

  def cheese_params
    params.require(:cheese).permit(:name, :description, :age, :user)
  end

  def fetch_cheese
    @cheese = Cheese.find(params[:id])
    @review = Review.new
    @review.user = current_user
    @reviews = @cheese.reviews
  end

  def fetch_errors
    if @cheese.errors.empty?
      ''
    else
      @cheese.errors.full_messages.to_sentence
    end
  end
end
