class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :hashtags, dependent: :destroy
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  after_save :parse_post_hashtags


  def parse_post_hashtags
    if self.caption.include?("#")
      hashtags = caption.split.select {|word| word.start_with?('#')}
      hashtags.map {|hashtag| self.hashtags.create(content: hashtag, href:"hashtags/#{hashtag.slice(1..-1)}", post_id: self.id )}
    end
  end
end
