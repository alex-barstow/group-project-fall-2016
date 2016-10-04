class CheesesController < ApplicationController

  def index
    @cheeses = Cheese.all
  end

  def show
    @cheese = Cheese.find(params[:id])
  end

  def new
    @cheese = Cheese.new
  end

  def create
    @cheese = Cheese.new(cheese_params)
    @cheese.user = current_user
    if @cheese.valid?
      @cheese.save
      flash[:notice] = "Cheese added successfully."
      redirect_to @cheese
    else
      render :new
    end
  end

  private

  def cheese_params
    params.require(:cheese).permit(:name, :description, :age, :user)
  end
end
