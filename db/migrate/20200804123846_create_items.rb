class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, add_index: true
      t.text :describe, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :shipping_region_id, null: false
      t.integer :days_until_shipping_id, null: false
      t.integer :price, null: false
      t.integer :purchase_status_id, null: false, default: 0
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end