class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy ]

  def index
  @items = Item.all.order("created_at DESC")
  end

  def new
  @item = Item.new
  end

  def create
  @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def show
  end

  def update
    redirect_to root_path unless current_user.id == @item.user_id
    if @item.update(item_params)
      redirect_to item_path
    else 
      render :edit
    end
  end

  def destroy
    redirect_to root_path unless current_user.id == @item.user_id
    @item.destroy
    redirect_to root_path
  end


  private
  def item_params
  params.require(:item).permit(:name,:introduction,:category_id,:item_condition_id,:shipping_free_id,:area_id,:ship_day_id,:selling_price,:image,).merge(user_id: current_user.id)
 end

 def set_item
  @item = Item.find(params[:id])
 end

end
