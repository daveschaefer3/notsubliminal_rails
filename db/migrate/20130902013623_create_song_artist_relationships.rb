class CreateSongArtistRelationships < ActiveRecord::Migration
  def change
    create_table :song_artist_relationships do |t|
      t.integer :song_id
      t.integer :artist_id

      t.timestamps
    end

    add_index :song_artist_relationships, :song_id
    add_index :song_artist_relationships, :artist_id
    add_index :song_artist_relationships, [:song_id, :artist_id], unique: true
  end
end
