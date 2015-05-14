class CreateGroupes < ActiveRecord::Migration
  def change
    create_table :groupes do |t|
    	t.string :name
    	t.text :description
    	t.type :

      t.timestamps
    end
  end
end
