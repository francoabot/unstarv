class AddArtistToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :artist, :string, :default => "No"
  end
end
