class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = Item.all
    render json: @items
  end

  def show
    render json: @item
  end

  def create
    if params[:auction_id].present?
      @auction = Auction.find(params[:auction_id])
      @item = @auction.items.new(item_params)
    else
      @item = Item.new(item_params)
    end
  
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end
  
  

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def set_item
    @auction = Auction.find(params[:auction_id])
    @item = Item.new(item_params.merge(auction_id: @auction.id))
  end
  

  def item_params
    params.require(:item).permit(:name, :description, :price, :bidstep, :category, :image, :auction)
  end
end