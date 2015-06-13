class CreateGroupcomments < ActiveRecord::Migration
  def change
    create_table :groupcomments do |t|
    
      t.references :groupost, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
    add_index :groupcomments, [:groupost_id, :created_at]
    add_index :groupcomments, [:user_id, :created_at]

  end
end
