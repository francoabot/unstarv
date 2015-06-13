class CreateGrouposts < ActiveRecord::Migration
  def change
    create_table :grouposts do |t|
      t.text :content
      t.references :group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
    add_index :grouposts, [:group_id, :created_at]
    add_index :grouposts, [:user_id, :created_at]
  end
end




   