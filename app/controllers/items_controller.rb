class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
def index
  #@items = Item.all
  @items = Item.order("created_at DESC")
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

  def edit
  end
  
end


  private
  def item_params
  params.require(:item).permit(:name,:introduction,:category_id,:item_condition_id,:shipping_free_id,:area_id,:ship_day_id,:selling_price,:image,).merge(user_id: current_user.id)
 end
end
