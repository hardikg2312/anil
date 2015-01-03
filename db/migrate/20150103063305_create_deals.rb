class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.integer :category_id
      t.string :deal_url
      t.text :description
      t.datetime :valid_till
      t.boolean :valid
      t.integer :discount_price
      t.integer :price
      t.string :photo_url
      t.string :slug

      t.timestamps
    end
  end
end
