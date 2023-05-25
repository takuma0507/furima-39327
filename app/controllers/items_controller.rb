class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end
end

  private

  def item_params
    params.require(:item).permit(:image, :item, :item_comment, :item_category_id, :item_situation_id, :delivery_money_id, :send_region_id, :send_day_id, :price).merge(user_id: current_user.id)
  end