require File.dirname(__FILE__) + '/../test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products
  
  def setup
    @cart = Cart.new
    @rails = products(:rails_book)
    @ruby = products(:ruby_book)
  end
  
  test "add unique products" do
    #cart = Cart.new
    #rails_book = products(:rails_book)
    #ruby_book = products(:ruby_book)
    @cart.add_product @rails
    @cart.add_product @ruby
    assert_equal 2, @cart.items.size
    assert_equal @rails.price + @ruby.price, @cart.total_price
  end
  
  test "add duplicate product" do
    #cart = Cart.new
    #rails_book = products(:rails_book)
    @cart.add_product @rails
    @cart.add_product @rails
    assert_equal 2*@rails.price, @cart.total_price
    assert_equal 1, @cart.items.size
    assert_equal 2, @cart.items[0].quantity
  end
end
