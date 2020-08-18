class TransactionsController < ApplicationController

  require 'payjp'

  before_action :correct_user, only: :index
  before_action :sold_item
  before_action :login_check, only: :index
  before_action :set_item, only: [:index, :correct_user, :sold_item, :pay_item]

  def index
  end

  def new
    @order = CreditAddress.new
  end

  def create
    @order = CreditAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def correct_user
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def sold_item
    if @item.order.present?
      redirect_to root_path
    end
  end

 def order_params
   params.permit(:price, :token, :postal_code, :prefecture, :city, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency:'jpy'
  )
 end

 def set_item
  @item = Item.find(params[:item_id])
 end

end