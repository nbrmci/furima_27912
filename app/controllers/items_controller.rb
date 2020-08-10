class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]

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

  def show
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :describe,
      :category_id,
      :condition_id,
      :shipping_charge_id,
      :shipping_region_id,
      :purchase_status_id,
      :days_until_shipping_id,
      :price,
      :user_id
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end