class User < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #socializations gem
  acts_as_followable
  acts_as_follower

end
