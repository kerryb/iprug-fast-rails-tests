class LineItem < ActiveRecord::Base
  belongs_to :order

  def total
    quantity * price
  end
end
