class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column :songs, :artist_id, :artist #change artist_id to artist in songs create_table
    # change_colunn :songs, :artist, :string #change type from integer to string
  end
end
