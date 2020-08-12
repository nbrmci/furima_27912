class OrdersController < ApplicationController

  before_action :correct_user, only: :index
  before_action :login_check, only: :index

  def index
    @item = Item.find(params[:format])
  end

  def create
  end

  private

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def correct_user
    @item = Item.find(params[:format])
    if @item.user == current_user
      redirect_to root_path
    end
  end
   
end