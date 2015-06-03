class AddCategoryToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :category, :string
  end
end
