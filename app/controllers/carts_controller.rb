class CartsController < ApplicationController
  before_action :set_cart

  def show
    render json: @cart, include: :items
  end

  def add_item
    item = Item.find(params[:item_id])
    @cart.items << item
    render json: @cart, include: :items
  end

  private

  def set_cart
    @cart = current_user.cart # You might need to adjust this based on your authentication setup
  end
end

