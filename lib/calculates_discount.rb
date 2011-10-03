class CalculatesDiscount
  def initialize order
    @order = order
  end

  def discount_percentage
    @order.line_items.inject(0) {|a, l| a + l.total } >= 100 ? 5 : 0
  end
end
