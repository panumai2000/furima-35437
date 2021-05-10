class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_record, only: [:index,:create]
  before_action :set_set_record, only: [:index,:create]

  def index
    @record_order = RecordOrder.new
  end

  def create
    @record_order = RecordOrder.new(record_order_params)
    if @record_order.valid?
      pay_item
      @record_order.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def record_order_params
    params.require(:record_order).permit(:postal_code, :delivery_prefectures_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: record_order_params[:token],    
      currency: 'jpy'
    )
  end

  def set_record
    @item = Item.find(params[:item_id]) 
  end

  def set_set_record
    if @item.user_id == current_user.id || @item.record.present?
      redirect_to root_path
    end
  end

end
