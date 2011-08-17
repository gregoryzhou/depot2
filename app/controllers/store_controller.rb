class StoreController < ApplicationController
  def add_to_cart
    @cart = find_cart
    product = Product.find(params[:id])
    @cart.add_product(product)
  end
  def index
    @products = Product.find_products_for_sale
  end

  private
  def find_cart
    session[:cart] ||= Cart.new
  end
end
