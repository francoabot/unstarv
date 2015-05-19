class Solve < ActiveRecord::Migration
  def change
  	drop_column :users, :current_sign_in_at
  	add_column :users, :current_sign_in_at, :datetime
  end
end
