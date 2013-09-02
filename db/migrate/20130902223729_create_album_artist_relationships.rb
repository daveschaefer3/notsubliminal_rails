class CreateAlbumArtistRelationships < ActiveRecord::Migration
  def change
    create_table :album_artist_relationships do |t|
      t.integer :album_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
