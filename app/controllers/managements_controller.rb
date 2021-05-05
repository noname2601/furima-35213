class ManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_management_item, only: [:index, :create ]
  before_action :pay_managements_purchases, only: [:create]

  def index
    @managements_purchases = ManagementPurchase.new
    redirect_to root_path if current_user.id == @item.user_id || @item.management.present?
  end


  def create
    @managements_purchases = ManagementPurchase.new(management_purchase_params)
    if @managements_purchases.valid?
      @managements_purchases.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def management_purchase_params
    params.require(:management_purchase).permit(:post_code, :area_id, :city, :adress, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id,token: params[:token] )
  end
  def set_management_item
    @item = Item.find(params[:item_id])
  end
  def pay_managements_purchases
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: management_purchase_params[:token],
      currency: 'jpy'
    )
   end
end
