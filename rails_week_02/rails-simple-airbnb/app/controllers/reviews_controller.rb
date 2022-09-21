class ReviewsController < ApplicationController
  before_action :set_flat, only: %i[create]

  def create
    @review = Review.new(review_params)
    @review.flat = @flat
  
    if @review.save
      redirect_to flat_path(@flat)
    else
      render [@flat, @review], status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to flat_path(@review.flat), status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
