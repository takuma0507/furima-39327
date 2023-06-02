class OrdersController < ApplicationController
  before_action :check_own_item, only: [:index]
  before_action :sold_out
  before_action :authenticate_user!

  def index
    @deliveryorder = DeliveryOrder.new
  end

  def create
    @deliveryorder = DeliveryOrder.new(deliveryorder_params)
    if @deliveryorder.valid?
      pay_item
      @item.save
      @deliveryorder.save
      redirect_to root_path
    else
      render 'index'
    end
  end


  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item[:price],  # 商品の値段
    card: deliveryorder_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end


  private

  def deliveryorder_params
    params.require(:delivery_order).permit(:post_code, :send_region_id, :municipality, :address, :building_name, :tel).merge(user_id: current_user.id, order_id: params[:order_id], item_id: params[:item_id], token: params[:token])
  end


  def item_params
    params.require(:item).permit(:image, :item, :item_comment, :item_category_id, :item_situation_id, :delivery_money_id, :send_region_id, :send_day_id, :price).merge(user_id: current_user.id)
  end

  def check_own_item
    item = Item.find(params[:item_id])
    if current_user == item.user || item.sold_out?
      redirect_to root_path
    elsif !current_user
      redirect_to new_user_session_path
    end
  end


  def sold_out
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
  end
end