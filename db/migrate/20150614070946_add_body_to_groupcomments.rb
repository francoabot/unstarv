class AddBodyToGroupcomments < ActiveRecord::Migration
  def change
    add_column :groupcomments, :body, :string
  end
end
