class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    @order_address.item_id = @item.id
    @order_address.user_id = current_user.id
  
    if @order_address.valid?
      if @order_address.save
        redirect_to root_path, notice: '購入が完了しました'
      else
        render :index
      end
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,:token)
  end
end
