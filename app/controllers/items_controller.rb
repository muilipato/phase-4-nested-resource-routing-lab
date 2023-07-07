class ItemsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    items = user.items
    render json: items
  end

    def show
      user = User.find(params[:user_id])
      item = user.items.find(params[:id])
      render json: item
    end

    def create
      user = User.find(params[:user_id])
      item = user.items.create(item_params)
      render json: item
    end

    private

    def item_params
      params.require(:item).permit(:name, :description, :price)
    end

end
