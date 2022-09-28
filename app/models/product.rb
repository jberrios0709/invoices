class Product
  attr_accessor :title, :quantity, :price, :imported

  DECIMAL_NEAREST = 0.05.freeze

  def calculate_total
    (subtotal + calculate_taxes).floor(2)
  end

  def calculate_taxes
    percentage = regular_taxes + taxes_by_import
    result = (subtotal * (percentage / 100.00)).round(2)
    result.to_i + up_to_next_round(result.modulo(1))
  end

  def subtotal
    price.to_f * quantity.to_f
  end

  def regular_taxes
    10.0
  end

  def taxes_by_import
    imported ? 5.0 : 0.0
  end

  def up_to_next_round(number)
    ((number / DECIMAL_NEAREST).ceil * DECIMAL_NEAREST).round(2)
  end
end