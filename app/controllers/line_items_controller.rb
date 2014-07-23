class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    @product = Product.find(params[:product_id])
#    @line_item = LineItem.create!(:cart => current_cart, :product => @product, :quantity => 1, :unit_price => @product.price)
    @line_item = LineItem.create!(:cart_id => current_cart.id, :product_id => @product.id, :quantity => 1, :unit_price => @product.price)
    flash[:notice] = "Added #{@product.name} to cart."
    redirect_to cart_path(@cart)
  end
end