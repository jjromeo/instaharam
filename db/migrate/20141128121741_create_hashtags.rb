class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :content
      t.string :href

      t.timestamps
    end
  end
end
