class FlatsController < ApplicationController
  before_action :get_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'Flat was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @task.destroy
    # redirect_to tasks_path, status: :see_other
  end

  # private

  def flat_params
    params.require(:flat).permit(:name, :description, :price_per_night, :number_of_guests, :picture_url)
  end

  def get_flat
    @flat = Flat.find(params[:id])
  end
end
