class AddUniqnessToSlug < ActiveRecord::Migration
  def change
  	add_index :deals, :slug, unique: true
  	add_index :categories, :slug, unique: true
  end
end
