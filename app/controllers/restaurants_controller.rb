class RestaurantsController < ApplicationController
  # A visitor can see the list of all restaurants.
  # A visitor can add a new restaurant, and be redirected to the show view of that new restaurant.
  # A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
  # A visitor can add a new review to a restaurant
  # A restaurant can have many reviews.
  # A review belongs to a restaurant.
  # From routes.rb
  # resources :restaurants, only: %i[index show new create] do
  #   resources :reviews, only: [:create]
  # end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
