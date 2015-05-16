class AddDeviceAttributesToUsers < ActiveRecord::Migration
 add_column :users, :authentication_token, :string
end
