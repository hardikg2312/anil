class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :photo_url
      t.integer :deals_count, :default => 0
      t.text :description
      t.string :slug
      
      t.timestamps
    end
  end
end
