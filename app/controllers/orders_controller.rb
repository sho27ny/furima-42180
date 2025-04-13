class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.item = Item.find(params[:item_id])

    if @order.save
      redirect_to @order, notice: '注文が完了しました'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:item_id)
  end
end
