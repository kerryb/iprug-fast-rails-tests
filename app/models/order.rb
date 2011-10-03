class Order < ActiveRecord::Base
  has_many :line_items

  def discount_percentage
    CalculatesDiscount.new(self).discount_percentage
  end
end
