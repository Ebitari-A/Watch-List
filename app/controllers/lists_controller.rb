class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  # As a user, I can view the details of a restaurant
  def show
    @list = List.find(params[:id])
  end

  # As a user, I can add a new restaurant
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
