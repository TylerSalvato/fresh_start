class CartsController < ApplicationController
  # before_action :authenticate_user!, only: [:show, :add_item]

  before_action :set_cart, except: :index

  def index
    @carts = Cart.all
    render json: @carts, include: :items
  end

  def show
    render json: @cart, include: :items
  end

  def add_item
    item = Item.find(params[:item_id])
    @cart.items << item
    render json: @cart, include: :items
  end

  private

  #def set_cart
    #guest_cart_id = session[:guest_cart_id] || create_guest_cart
    #@cart = Cart.find_by(id: guest_cart_id)
  #end

  #def create_guest_cart
    #cart = Cart.create
    #session[:guest_cart_id] = cart.id
    #cart.id
  #end
#end


