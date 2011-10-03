class OrderRecord < ActiveRecord::Base
  table_name :orders

  has_many :line_items
end
