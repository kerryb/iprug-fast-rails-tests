class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :description
      t.integer :quantity
      t.decimal :price
      t.integer :order_id

      t.timestamps
    end
  end
end
