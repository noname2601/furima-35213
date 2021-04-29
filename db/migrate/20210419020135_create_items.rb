class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :introduction,         null: false
      t.integer :category_id,       null: false
      t.integer :item_condition_id, null: false
      t.integer :shipping_free_id,  null: false
      t.integer :area_id,           null: false
      t.integer :ship_day_id,       null: false
      t.integer :selling_price,     null: false
      t.integer :user_id,           null:false, foreign_key:true
      t.timestamps
    end
  end
end
