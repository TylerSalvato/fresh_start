class ItemsController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action  :verify_authenticity_token

  before_action :set_item, only: [:show, :update, :destroy]

  def index
    if params[:auctionId].present?
      @items = Item.where(auction_id: params[:auctionId])
    else
      @items = Item.all
    end

    render json: @items
  end

  
  

  def show
    render json: @item
  end

  def create
    auction = Auction.find_by(id: params[:item][:auction_id])
    
    if auction
      #@item = auction.items.build(item_params)
      @item = Item.new(item_params)

      if @item.save
        render json: @item, status: :created
      else
        render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Auction not found' }, status: :not_found
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
    if params[:auction_id].present?
      @auction = Auction.find(params[:auction_id])
      @item = @auction.items.find(params[:id])
    else
      @item = Item.find(params[:id])
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :bidstep, :category, :image, :auction_id)
  end
end
