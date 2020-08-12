class OrdersController < ApplicationController

  before_action :login_check, only: :index

  def index
  end

  def create
    @item = Item.find(params[:id])
  end

  private

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end