class AddColumnEncryptedPasswordToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :encrupted_password
  	add_column :users, :encrypted_password, :string
  end
end
