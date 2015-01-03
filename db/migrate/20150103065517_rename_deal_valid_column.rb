class RenameDealValidColumn < ActiveRecord::Migration
  def self.up
    rename_column :deals, :valid, :deal_valid
  end

  def self.down
   	rename_column :deals, :deal_valid, :valid
  end
end
