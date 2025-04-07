class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image,:category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_time_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
  
    # ログインしていない場合、ログインページにリダイレクト
    unless user_signed_in?
      redirect_to new_user_session_path
    else
      # ログインしている場合、かつ自身が出品した商品でない場合
      if @item.user != current_user
        redirect_to root_path
      end
    end
  end

end
