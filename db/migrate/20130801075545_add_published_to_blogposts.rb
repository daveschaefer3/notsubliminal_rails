class AddPublishedToBlogposts < ActiveRecord::Migration
  def change
    add_column :blogposts, :published, :boolean, default: false
    add_column :blogposts, :published_at, :timestamp, default: nil
  end
end
