class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if @order_delivery_address.valid?
      @order_delivery_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


  private

  def order_params
    params.require(:order_delivery_address).permit(:user_id, :item_id, :city, :zip_code, :prefecture_id, :city, :street_address, :building_name, :telephone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def non_purchased_item
    # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end