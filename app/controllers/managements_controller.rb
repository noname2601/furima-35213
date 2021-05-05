class ManagementsController < ApplicationController
  before_action :authenticate_user!
  def index
    @managements_purchases = ManagementPurchase.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.management.present?
  end


  def create
    @item = Item.find(params[:item_id])
    @managements_purchases = ManagementPurchase.new(management_purchase_params)
    if @managements_purchases.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.selling_price,
        card: management_purchase_params[:token],
        currency: 'jpy'
      )
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
end
