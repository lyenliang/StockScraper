class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.date :recommend_date
      t.string :stock_number
      t.string :stock_name
      t.float :enter_price
      t.float :target_price
      t.float :current_price
      t.text :description

      t.timestamps null: false
    end
  end
end
