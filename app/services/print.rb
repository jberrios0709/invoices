module Services
  class Print
    attr_accessor :invoice, :output

    def print
      restart_output
      add_products
      add_total_sales_taxes
      add_total
      @output
    end

    private

    def add_products
      @invoice.products.each do |product|
        @output += "#{product.quantity} #{product.title}: #{product.calculate_total}\n"
      end
    end

    def add_total_sales_taxes
      @output += "Sales Taxes: #{@invoice.calculate_taxes}\n"
    end

    def add_total
      @output += "Total: #{@invoice.calculate_total}"
    end

    def restart_output
      @output = ''
    end
  end
end