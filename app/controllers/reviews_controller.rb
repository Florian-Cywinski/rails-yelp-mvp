class ReviewsController < ApplicationController
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

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
