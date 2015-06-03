class AddAttributesToGroup < ActiveRecord::Migration
  def change
  	add_column :groups, :score, :integer
  	add_column :groups, :expertise, :string
  	add_column :groups, :country, :string
  end
end
