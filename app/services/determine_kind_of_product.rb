module Services
  class DetermineKindOfProduct
    class << self
      REGEX = '(\d)+\s(.+)+\sat\s(\d+.\d+)'.freeze
      KEYWORDS = [
        {
          keywords: ['book'],
          class: Book
        },
        {
          keywords: ['pills'],
          class: Medicine
        },
        {
          keywords: ['chocolate'],
          class: Food
        },
        {
          keywords: [''],
          class: Product
        }
      ].freeze

      IMPORTED = 'imported'.freeze

      def call(data)
        return nil unless data.match?(REGEX)

        quantity, title, price = data.match(REGEX).captures
        instance_product(title, quantity, price)
      end

      private

      def instance_product(title, quantity, price)
        klass = nil
        KEYWORDS.each do |data|
          data[:keywords].each do |keyword|
            if title.include?(keyword)
              klass = data[:class].new
              break
            end
          end
          break unless klass.nil?
        end

        complete_product(klass, title, quantity, price)
      end

      def complete_product(object, title, quantity, price)
        object.imported = title.include?(IMPORTED)
        object.title = title
        object.quantity = quantity
        object.price = price
        object
      end
    end
  end
end
