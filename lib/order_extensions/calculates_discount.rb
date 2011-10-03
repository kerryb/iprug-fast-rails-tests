module OrderExtensions
  module CalculatesDiscount
    def discount_percentage
      line_items.inject(0) {|a, l| a + l.total } >= 100 ? 5 : 0
    end
  end
end
