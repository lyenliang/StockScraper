class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :recommend_date
      t.string :stock_number
      t.string :stock_name
      t.string :enter_date
      t.float :enter_price
      t.float :target_price
      t.float :current_price
      t.float :return
      t.string :return_ratio
      t.text :description

      t.timestamps null: false
    end
  end
end
