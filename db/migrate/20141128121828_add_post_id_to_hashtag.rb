class AddPostIdToHashtag < ActiveRecord::Migration
  def change
    add_reference :hashtags, :post, index: true
  end
end
