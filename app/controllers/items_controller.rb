class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end



  private
  def item_params
  params.require(:item).permit(:name,:introduction,:category_id,:item_condition_id,:shipping_free_id,:area_id,:ship_day_id,:selling_price,:image,).merge(user_id: current_user.id)
 end

end
