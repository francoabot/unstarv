class RemoveAndReadScoreToGroups < ActiveRecord::Migration
  def change
  	remove_column :groups, :score, :integer
  	add_column :groups, :score, :integer, :default => 0
  end
end
