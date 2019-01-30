class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :songs, :artist, :string #change type from integer to string
  end
end
