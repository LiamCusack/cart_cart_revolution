require './lib/product'

class ShoppingCart
  attr_reader :name, :capacity, :products, :total_number_of_products, :products_by_category

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @details = {name: @name, capacity: @capacity}
    @total_number_of_products = 0
    @products_by_category = {}
  end

  def add_product(product)
    @products << product
    @total_number_of_products += product.quantity
  end

  def is_full?
    if @total_number_of_products >= @capacity
      true
    else
      false
    end
  end

  def percentage_occupied
    #i have no idea why this was necessary, but despite the same math it only worked in this format
    (100.0 / @capacity * @total_number_of_products).round(2)
  end

  def sorted_products_by_quantity
    self.products.sort_by {|product| - product.quantity}
  end

  def product_breakdown#almost done
    self.products.map do |product|
    @products_by_category = {
      product.category => product
    }
    end
  end

  def details
    @details
  end

end
