class Order < ActiveRecord::Base
  include OrderExtensions::CalculatesDiscount

  has_many :line_items
end
