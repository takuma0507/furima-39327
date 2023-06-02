class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update]
  before_action :sold_edit, only: :edit

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
    end
      redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :item_comment, :item_category_id, :item_situation_id, :delivery_money_id, :send_region_id, :send_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_owner
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def sold_edit
    if @item.order.present?
      redirect_to root_path
    end
  end
end