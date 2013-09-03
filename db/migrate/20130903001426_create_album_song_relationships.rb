class CreateAlbumSongRelationships < ActiveRecord::Migration
  def change
    create_table :album_song_relationships do |t|
      t.integer :album_id
      t.integer :song_id

      t.timestamps
    end

    add_index :album_song_relationships, :album_id
    add_index :album_song_relationships, :song_id
    add_index :album_song_relationships, [:album_id, :song_id], unique: true

    add_index :album_artist_relationships, :album_id
    add_index :album_artist_relationships, :artist_id
    add_index :album_artist_relationships, [:album_id, :artist_id]
  end
end
