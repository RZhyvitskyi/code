class ListsController < ApplicationController
  before_action :get_user
  before_action :get_list, only: [:show]

  def index
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(flat_params)
    @list.user = @user

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def flat_params
    params.require(:list).permit(:name)
  end

  def get_user
    @user = current_user
  end

  def get_list
    @list = List.find(params[:id])
  end
end
