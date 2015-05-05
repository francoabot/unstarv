class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firtname
      t.string :lastName
      t.string :username
      t.string :email
      t.string :country
      t.string :state
      t.string :city
      t.string :profession
      t.string :industry
      t.string :password_digest

      t.timestamps
    end
  end
end
