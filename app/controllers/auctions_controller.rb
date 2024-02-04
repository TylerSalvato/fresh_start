class AuctionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_auction, only: [:show, :update, :destroy]

  def index
    @auctions = Auction.all
    render json: @auctions
  end

  def show
    render json: @auction
  end

  def create
    ActiveRecord::Base.transaction do
      @auction = Auction.new(auction_params)

      if @auction.save
        render json: @auction, status: :created
      else
        render json: { error: 'Failed to create auction. Please try again.' }, status: :unprocessable_entity
      end
    end
  end

  def update
    if @auction
      if @auction.update(auction_params)
        render json: @auction
      else
        render json: @auction.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Auction not found' }, status: :not_found
    end
  end

  def destroy
    if @auction
      @auction.destroy
      head :no_content
    else
      render json: { error: 'Auction not found' }, status: :not_found
    end
  end

  private

  def set_auction
    @auction = Auction.find_by(id: params[:id])
  end

  def auction_params
    params.require(:auction).permit(:title, :goal, :startdate, :enddate, :starttime, :endtime, :description)
  end
end
