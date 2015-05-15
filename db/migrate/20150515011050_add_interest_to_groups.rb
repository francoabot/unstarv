class AddInterestToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :interest, :string
  end
end
