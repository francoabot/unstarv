class AddPrivacyTypeToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :privacy_type, :string
  end
end
