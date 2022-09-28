class Invoice
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_product(data)
    @products << Services::DetermineKindOfProduct.call(data)
  end

  def calculate_total
    @products.map(&:calculate_total).sum
  end

  def calculate_taxes
    @products.map(&:calculate_taxes).sum
  end
end