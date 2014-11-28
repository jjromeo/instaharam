class AddPostIdToHashtag < ActiveRecord::Migration
  def change
    add_reference :hashtags, :Post, index: true
  end
end
